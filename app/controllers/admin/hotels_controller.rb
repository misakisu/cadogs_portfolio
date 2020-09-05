class Admin::HotelsController < ApplicationController
  before_action :authenticate_admin!

  #管理者用のホテル一覧
  def index
    @hotels = Hotel.all.order(created_at: "DESC").page(params[:page]).per(5)
     #indexページにて送られて生きたステータス(is_valid)でホテルを検索
      if params[:is_valid]
        @is_valid = params[:is_valid]
        hotels = Hotel.where(is_valid: @is_valid)
        @hotels = Kaminari.paginate_array(hotels).page(params[:page]).per(5)
     end
  end

  def show
    @hotel = Hotel.find(params[:id])
    @reservations = @hotel.reservations.page(params[:page]).per(5)
  end

  def edit
    @hotel = Hotel.find(params[:id])
  end

  def update
    @hotel = Hotel.find(params[:id])
    if @hotel.update(hotel_params)
      flash[:success] = "ホテル情報が更新されました"
      @hotels = Hotel.all.page(params[:page]).per(5)
      render "index"
    end
  end

  def destroy
    @hotel = Hotel.find(params[:id])
    if @hotel.destroy
      flash[:success] = "ホテル情報が削除されました。"
      redirect_to admin_hotels_path
    end
  end

  private
  def hotel_params
    params.require(:hotel).permit(:owner_id, :name, :image, :price, :address, :phone_number, :image, :introduction, :is_valid)
  end
end
