class HotelsController < ApplicationController
  def index
    @hotels = Hotel.all
  end

  def show
    @hotel = Hotel.find(params[:id])
    @hotel_comment = HotelComment.new
    @hotel_comments = @hotel.hotel_comments #hotelのidに紐づいたhotels全部
    @reservation = Reservation.new
    #User以外の場合はペット情報無し且つ不要である情報を下記で定義
    if current_user
      @pets = current_user.pets #Userのペット一覧の情報
    end
  end

private
  def hotel_params
    params.require(:hotel).permit(:owner_id, :name, :image, :price, :address, :phone_number, :image, :introduction, :is_valid)
  end
end
