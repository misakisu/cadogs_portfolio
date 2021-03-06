class OwnersController < ApplicationController
  before_action :authenticate_owner!

  def show
    @owner = current_owner
    @hotels =@owner.hotels.order(created_at: "DESC").page(params[:page]).per(5)
  end

  def confirm
    @owner = current_owner
    if current_owner.id != @owner.id
      redirect_to owner_path(@owner)
    end
  end

  def hide
    @owner = current_owner
    #hideアクションでis_vaildカラムをfalseへupdate
    if @owner.update(is_valid: false)
       reset_session
       flash[:success] = "ありがとうございました。またのご利用を心よりお待ちしております。"
       redirect_to owner_home_path
    else
       render edit_owner_registration_path
    end
  end

  private
  def owner_params
    params.require(:owner).permit(:email, :name, :phone_number, :is_valid)
  end
end
