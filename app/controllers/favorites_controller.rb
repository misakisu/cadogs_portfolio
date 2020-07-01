class FavoritesController < ApplicationController
  def create
    @hotel = Hotel.find(params[:hotel_id])
    @favorite = @hotel.favorites.new(user_id: current_user.id)#どのuserのコメントかという情報をおくるためuser_idを定義
    @favorite.save
  end

  def destroy
  	@hotel = Hotel.find(params[:hotel_id])
    @favorite = @hotel.favorites.find_by(user_id: current_user.id)
    @favorite.destroy
  end
end
