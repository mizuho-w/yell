class ReservationsController < ApplicationController

	def create
		@item = Item.find(params[:id])
		@reservation = Reservation.new
		@reservation.user = current_user
		@reservation.item = @item
		if @reservation.save
			flash[:notice] = "予約が完了しました"
           redirect_to item_path(@item.id)
        else
           render 'items/show'
        end
	end

	def destroy
		@item = Item.find(params[:id])
		@reservation = Reservation.find_by(user_id:current_user.id,item_id:@item.id)
	 if @reservation.destroy
      flash[:notice] = "予約は削除されました"
		  redirect_to item_path(@item.id)
   else
      flash[:notice] = "予約削除に失敗しました"
      render 'items/show'
    end
	end

    def reserve_user
  	    @item = Item.find(params[:id])
  	    @reservations = Reservation.where(item_id: @item.id)
    end

    def myitem
      @user = User.find(params[:id])
      @reservations = Reservation.where(user_id: current_user.id)
    end

    def update
      @reservation = Reservation.find(params[:id])
      @reservation.update(reservation_params)
      redirect_to reserve_user_path(@reservation.item.id)
    end

    def following
      @user = User.find(params[:id])
    end

    def followers
      @user = User.find(params[:id])
    end

  private

    def reservation_params
    	params.require(:reservation).permit(:user_id, :item_id, :receipt_date, :remark, :status)
    end

    def user_params
      params.require(:user).permit(:name, :image, :introduction, :is_deleted, :is_admin, :email)
    end

end
