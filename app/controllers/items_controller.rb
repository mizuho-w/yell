class ItemsController < ApplicationController

  def index
    @items = Item.all.page(params[:page]).per(6)
    @genres = Genre.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.user = current_user
    tag_list = params[:item][:tag_name].split
    if @item.save
      @item.save_tag(tag_list)
      redirect_to item_path(@item.id)
    else
      render 'new'
    end
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to myitem_path(current_user.id)
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    redirect_to item_path(@item.id)
  end

  def show
    @item = Item.find(params[:id])
    @reservation = Reservation.new
  end

  def search
    @tag = Tag.find(params[:tag_search])
    @items = @tag.items.page(params[:page]).per(6)
    @genres = Genre.all
  end

  private

  def item_params
    params.require(:item).permit(:img, :name, :artist_name, :explanation, :genre_id, :tag_id, :status, :distribute_place, :distribute_date)
  end

end
