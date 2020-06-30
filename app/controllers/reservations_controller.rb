class ReservationsController < ApplicationController
  def confirm
  @user = current_user#表示させるためのみ
  @reservation = current_user.reservations.new(reservation_params)
  @total_price = 3000
  end

  def create
  #Confirm画面で戻るボタンでホテルshow画面、確定でSave
  @reservation = current_user.reservations.new(reservation_params)
  @user = current_user
    if params[:back]
      @hotel = Hotel.find(params[:id])
      render hotel_path(@hotel)
    elsif @reservation.save
      render "finish"
    end
  end
  #参考:newとsaveはcreateでまとめることが可能。今回は下記で統一。

  private
  def reservation_params
    params.require(:reservation).permit(:user_id, :hotel_id, :start_date, :end_date, :total_price, :request)
  end
end
