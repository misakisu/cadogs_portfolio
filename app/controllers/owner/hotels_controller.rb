class Owner::HotelsController < ApplicationController
  before_action :authenticate_owner!

  def new
    @hotel = Hotel.new
    @owner = current_owner
    @hotel.hotel_images.build#関連するモデルを生成するときはbuild
  end

  def create
    @hotel = current_owner.hotels.new(hotel_params)
    if @hotel.save
      flash[:success] = "ホテル情報が申請されました！営業日2～3日以内にご連絡差し上げます。"
      redirect_to owner_path
    else
      @hotel.hotel_images.build#関連するモデルを生成するときはbuild
      render "new"
    end
  end

  def show
    @hotel = Hotel.find(params[:id])
    @reservations = @hotel.reservations.page(params[:page]).per(5)
  end

  def edit
    @hotel = Hotel.find(params[:id])
    if current_owner.id != @hotel.owner.id
    redirect_to owner_path
    end
  end

  def update
    @hotel = Hotel.find(params[:id])
    if @hotel.update(hotel_params)
      flash[:success] = "ホテル情報が更新されました！"
      redirect_to owner_path
    else
      render "edit"
    end
  end

  def destroy
    @hotel = Hotel.find(params[:id])
    if @hotel.destroy
      flash[:success] = "ホテル情報が削除されました。"
      redirect_to owner_path
    end
  end

private
  def hotel_params
    params.require(:hotel).permit(:owner_id, :name, :image, :price, :address, :phone_number, :image, :introduction, :is_valid, hotel_images_images: [], pet_genre_ids: [])
  end
end
