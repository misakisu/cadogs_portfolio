class ReservationsController < ApplicationController
  def confirm
  @user = current_user#表示させるためのみ
  @reservation = current_user.reservations.new(reservation_params)
  #滞在日数の計算
  enddate = params[:end_date].to_i
  startdate = params[:start_date].to_i
  @stay_days = (enddate - startdate).to_i
  #合計金額の計算
  #@total_price = @hotel.price*@stay_days
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
