class HotelCommentsController < ApplicationController
  def create
    @hotel = Hotel.find(params[:hotel_id])
    @comment = @hotel.hotel_comments.new(hotel_comment_params)
    @comment.user_id = current_user.id#どのuserのコメントかという情報をおくるためuser_idを定義
    if @comment.save
      flash[:success] = "コメントが投稿されました"
      #redirect_to hotel_path(@hotel)
    else
      render hotel_path(@hotel)
    end
  end

  def destroy
    @hotel = Hotel.find(params[:hotel_id])
    @hotel_comment = HotelComment.find(params[:id])
    if @hotel_comment.user == current_user
    @hotel_comment.destroy
    redirect_to hotel_path(@hotel)
    end
  end

  private
  def hotel_comment_params
    params.require(:hotel_comment).permit(:comment, :user_id, :hotel_id)
  end
end

