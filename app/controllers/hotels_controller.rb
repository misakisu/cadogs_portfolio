class HotelsController < ApplicationController
  def index
    @pet_genres = PetGenre.all
    @hotels = Hotel.where(is_valid: "true")#無効なホテル(未承認ホテル)は非表示
    #検索に必要な情報(中間テーブルを活用して検索)
    if params[:pet_genre_id]
     @pet_genre_id = params[:pet_genre_id]
     @hotels_all = @pet_genre_id.hotels
     @hotels = @hotels_all.where(is_valid: "true")
     else
     render "index"
    end
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
