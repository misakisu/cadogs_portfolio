class OwnersController < ApplicationController
  def show
    @owner = current_owner
    @hotels =@owner.hotels
  end

  def confirm
    @owner = current_owner
  end

  def hide
    @owner = current_owner
    #hideアクションでis_vaildカラムをfalseへupdate
    if @owner.update(is_valid: false)
       reset_session
       flash[:notice] = "ありがとうございました。またのご利用を心よりお待ちしております。"
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
