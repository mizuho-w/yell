class UsersController < ApplicationController
  
  def mypage
  	@user = User.find(params[:id])
  end

  def myitem
  end

  def edit
  	@user = User.find(params[:id])
  end

private
 def user_params
 	params.require(:user).permit(:name, :image, :introduction, :is_deleted, :is_admin, :email)
 end


end
