class HomesController < ApplicationController
  def top
  	@items = Item.where(status: true).joins(:genre).where(genres: { is_active: true }).page(params[:page]).per(3)
  end

  def about
  end


end
