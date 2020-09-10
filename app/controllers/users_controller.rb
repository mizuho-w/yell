class UsersController < ApplicationController
  
  def mypage
  	@user = User.find(params[:id])
  end

  def myitem
  	@user = User.find(params[:id])
  	@items = Item.where(user_id: current_user.id)
  end

  def edit
  	@user = User.find(params[:id])
  end

private
 def user_params
 	params.require(:user).permit(:name, :image, :introduction, :is_deleted, :is_admin, :email)
 end


end
