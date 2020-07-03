class ReservationsController < ApplicationController
  def confirm
    @reservation = current_user.reservations.new(reservation_params)
    @user = current_user
    @pet = Pet.find(reservation_params[:pet_id])
    @hotel = Hotel.find(reservation_params[:hotel_id])
    require "date"#日付データ利用宣言
    #Stringを日付データへ変換
    @enddate = Date.parse(reservation_params[:end_date])
    @startdate = Date.parse(reservation_params[:start_date])
    #合計金額の計算
    @stay_length = (@enddate - @startdate).to_i
    @total_price = @hotel.price * @stay_length
  end

  def create
    @reservation = current_user.reservations.new(reservation_params)
    @hotel = Hotel.find(reservation_params[:hotel_id])#reservationから受け取ったidでホテル検索
    @user = current_user
    #Confirm画面で戻るボタンでホテルshow画面へ
      if params[:back]
        #hotels/showへ戻る際に再度下記情報を渡す
        @hotel_comment = HotelComment.new
        @hotel_comments = @hotel.hotel_comments
        render "hotels/show"#hotel_path(@hotel.id)では他コントローラへrenderできない
      #Confirm画面で確定ボタンでSave
      elsif @reservation.save
        redirect_to finish_user_reservations_path
      end
  end
  #参考:newとsaveはcreateでまとめることが可能

  private
  def reservation_params
    params.require(:reservation).permit(:user_id, :hotel_id, :pet_id, :start_date, :end_date, :total_price, :id, :request)
  end
end

