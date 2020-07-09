class HotelsController < ApplicationController
  def index
    @pet_genres = PetGenre.all
    @hotels = Hotel.where(is_valid: "true")#無効なホテル(未承認ホテル)は非表示
    #検索に必要な情報をメソッドをつかって検索(中間テーブルを活用して検索)
    if params[:pet_genre_id]
      @pet_genre = PetGenre.find_by(id: params[:pet_genre_id])
      @hotels = @pet_genre.hotels.where(is_valid: "true")#受け取ったペットIDに基づくHotelをすべて取得+有効(承認済み)のもの
    end
  end

  def show
    @hotel = Hotel.find(params[:id])
    @hotel_comment = HotelComment.new
    @hotel_comments = @hotel.hotel_comments #hotelのidに紐づいたhotels全部
    @reservation = Reservation.new
    @pet_genres = PetGenre.all
    #User以外の場合はペット情報無し且つ不要である情報を下記で定義
    if current_user
      @pets = current_user.pets #Userのペット一覧の情報
    end
    #検索に必要な情報をメソッドをつかって検索(中間テーブルを活用して検索)
    if params[:pet_genre_id]
      @pet_genre = PetGenre.find_by(id: params[:pet_genre_id])
      @hotels = @pet_genre.hotels.where(is_valid: "true")#受け取ったペットIDに基づくHotelをすべて取得+有効(承認済み)のもの
      render "index"
    end
  end

private
  def hotel_params
    params.require(:hotel).permit(:owner_id, :name, :image, :price, :address, :phone_number, :image, :introduction, :is_valid)
  end
end
