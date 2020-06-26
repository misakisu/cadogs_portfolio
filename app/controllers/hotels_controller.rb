class HotelsController < ApplicationController
  def index
  @hotels = Hotel.all
  end

  def show
  @hotel = Hotel.find(params[:id])
  @hotel_comment = HotelComment.new
  @hotel_comments = @hotel.hotel_comments #hotelのidに紐づいたhotels全部
  end

private
  def hotel_params
    params.require(:hotel).permit(:owner_id, :name, :image, :price, :address, :phone_number, :image, :introduction, :is_valid)
  end
end
