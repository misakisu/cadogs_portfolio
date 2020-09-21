class FavoritesController < ApplicationController
  before_action :authenticate_user!

  def create
    @hotel = Hotel.find(params[:hotel_id])
    @favorite = @hotel.favorites.new(user_id: current_user.id)#どのuserのコメントかという情報をおくるためuser_idを定義
    respond_to do |format|
      if @favorite.save
        format.html
        format.json { render json: {status: 'success', favorite: @favorite, counts: favorite.where(hotel_id: @favorite.hotel_id, user_id: current_user).count, favorited: true} }
      end
    end
  end

  def destroy
  	@hotel = Hotel.find(params[:hotel_id])
    @favorite = @hotel.favorites.find_by(user_id: current_user.id)
    @favorite.destroy
  end
end
