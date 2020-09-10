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
	end

    def reserve_user
  	    @item = Item.find(params[:id])
  	    @reservations = Reservation.where(item_id: @item.id)
    end

    def update
    end

  private
    def item_params
   	    params.require(:item).permit(:img, :name, :artist_name, :explanation, :genre_id, :tag_id, :status, :distribute_place, :distribute_date)
     end

    def reservation_params
    	params.require(:reservation).permit(:user_id, :item_id, :receipt_date, :remark, :status)
    end

end
