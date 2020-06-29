class ReservationsController < ApplicationController
  def create
  #newとsaveはcreateでまとめることが可能。今回は下記で統一。
  @reservation = current_user.reservations.new(reservation_params)
  @user = current_user
  @reservation.save
  end

  private
  def reservation_params
    params.require(:reservation).permit(:user_id, :hotel_id, :start_date, :end_date, :total_price, :request)
  end
end
