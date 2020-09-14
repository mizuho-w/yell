class UsersController < ApplicationController
  
  def mypage
  	@user = User.find(params[:id])
    @items = Item.where(user_id: current_user.id)
    @reservations = Reservation.where(user_id: current_user.id)
  end

  def myitem
  	@user = User.find(params[:id])
  	@items = Item.where(user_id: current_user.id)
  end

  def edit
  	@user = current_user
  end

  def update
  	@user = User.find(params[:id])
  	if @user.update(user_params)
  		flash[:notice] = "会員情報を更新しました。"
  		redirect_to mypage_path(@user)
  	else
  		flash[:notice] = "会員情報の更新に失敗しました。"
  		render :edit
  	end
  end

private
 def user_params
 	params.require(:user).permit(:name, :image, :introduction, :is_deleted, :is_admin, :email)
 end


end
