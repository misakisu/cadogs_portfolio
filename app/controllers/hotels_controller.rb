class HotelsController < ApplicationController

  def index
    @pet_genres = PetGenre.all
    #お気に入りが多い順に表示+ステータスが有効なホテルを取得
    @hotel_all = Hotel.where(is_valid: "true").includes(:favorites)#左外部結合でテーブルを結合
    @hotels = @hotel_all.sort_by {|hotel| hotel.favorites.count}.reverse#昇順に並べ替え
    #中間テーブルを活用してペットジャンルで検索+ステータスが有効なホテルを取得
    if params[:pet_genre_id]
      @pet_genre = PetGenre.find_by(id: params[:pet_genre_id])
      @hotel_all = @pet_genre.hotels.where(is_valid: "true").includes(:favorites)
      @hotels = @hotel_all.sort_by {|hotel| hotel.favorites.count}.reverse#昇順に並べ替え
    end
  end

  #(前のバ―ション)hotel一覧をいいね昇順に並べ替え、ホテルのステータスが有効なものだけをhotelsの配列に入れる
  #@hotel_ranks = Favorite.group(:hotel_id).order('count(hotel_id) desc').pluck(:hotel_id)
    #@hotels = []
    #@hotel_ranks.each do |hotel_rank|
      #@hotel = Hotel.find(hotel_rank)
      #if @hotel.is_valid == true
         #@hotels.push(@hotel)
      #end
    #end

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
    #User以外が閲覧している場合はペット情報を持たない且つ予約不可のため下記で分岐
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
