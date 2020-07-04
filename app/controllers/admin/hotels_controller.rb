class Admin::HotelsController < ApplicationController
  #管理者用のホテル一覧
  def index
    @hotels = Hotel.all
     #indexページにて送られて生きたステータス(is_valid)でホテルを検索
     if params[:is_valid]
     @is_valid = params[:is_valid]
     @hotels = Hotel.where(is_valid: @is_valid)
     else
     render "index"
     end
  end

  def edit
    @hotel = Hotel.find(params[:id])
  end

  def update
    @hotel = Hotel.find(params[:id])
    if @hotel.update(hotel_params)
      flash[:success] = "ホテル情報が更新されました"
      redirect_to admin_hotels_path
    else
      render "edit"
    end
  end

  def destroy
    @hotel = Hotel.find(params[:id])
    if @hotel.destroy
      flash[:success] = "ホテル情報が削除されました。"
      redirect_to admin_hotels_path
    else
      render "edit"
    end
  end

  private
  def hotel_params
    params.require(:hotel).permit(:owner_id, :name, :image, :price, :address, :phone_number, :image, :introduction, :is_valid)
  end
end
