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
    if @item.save
      redirect_to item_path(@item.id)
    else
      render 'new'
    end
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
  end

  private

  def item_params
    params.require(:item).permit(:img, :name, :artist_name, :explanation, :genre_id, :tag_id, :status, :distribute_place, :distribute_date)
  end

end
