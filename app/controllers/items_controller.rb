class ItemsController < ApplicationController

  def index
    @items = Item.where(status:true).page(params[:page]).per(6).order(created_at: "DESC")
    else
    @genres = Genre.where(is_active:true)
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
    if params[:tag_search]
      @tag = Tag.find(params[:tag_search])
      @items = @tag.items.page(params[:page]).per(6)
      @search_word = @tag.name
    elsif params[:name_search]
      @items = Item.where(artist_name: params[:name_search]).page(params[:page]).per(6)
      @search_word = params[:name_search]
    elsif params[:genre_search]
      @genre = Genre.find(params[:genre_search])
      @items = @genre.items.page(params[:page]).per(6)
      @search_word = @genre.name
    end
      @genres = Genre.all
  end

  private

  def item_params
    params.require(:item).permit(:img, :name, :artist_name, :explanation, :genre_id, :tag_id, :status, :distribute_place, :distribute_date, :distribute_date_fin)
  end

end
