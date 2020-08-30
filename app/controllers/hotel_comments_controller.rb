class HotelCommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @hotel = Hotel.find(params[:hotel_id])
    @comment = @hotel.hotel_comments.new(hotel_comment_params)
    @comment.user_id = current_user.id
  end

  def destroy
    @hotel_comment = HotelComment.find(params[:id])
    if @hotel_comment.user == current_user
       @hotel_comment.destroy
    end
    @hotel = Hotel.find(@hotel_comment.hotel_id)#非同期の変数のため
  end

  private
  def hotel_comment_params
    params.require(:hotel_comment).permit(:comment, :user_id, :hotel_id)
  end
end

