class HotelsController < ApplicationController

  def index
    @pet_genres = PetGenre.all
    #お気に入りが多い順に表示+ステータスが無効なものに関しては
    @hotel_ranks = Favorite.group(:hotel_id).order('count(hotel_id) desc').pluck(:hotel_id)
    @hotels = []
    @hotel_ranks.each do |hotel_rank|
      @hotel = Hotel.find(hotel_rank)
      if @hotel.is_valid == true
         @hotels.push(@hotel)
      end
    end
    #検索に必要な情報をメソッドをつかって検索(中間テーブルを活用して検索)
    if params[:pet_genre_id]
      @pet_genre = PetGenre.find_by(id: params[:pet_genre_id])
      @hotels = @pet_genre.hotels.where(is_valid: "true")
      #受け取ったペットIDに基づくHotelをすべて取得+有効(承認済み)のもの
    end
  end

  def show
    @hotel = Hotel.find(params[:id])
    #ホテルのステータスが無効なものはページ遷移できない設定
    if @hotel.is_valid == false
      flash[:error] = "こちらのホテルは無効です"
      redirect_to hotels_path
    end
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
