class UsersController < ApplicationController
  def show
    @user = current_user
    @pets = @user.pets
  end

  def confirm
    @user = current_user
  end

  def hide
    @user = current_user
    #hideアクションでis_vaildカラムをfalseへupdate
    if @user.update(is_valid: false)
       reset_session
       flash[:notice] = "ありがとうございました。またのご利用を心よりお待ちしております。"
       redirect_to root_path
    else
       render edit_user_registration_path
    end
  end

  private
  def user_params
    params.require(:user).permit(:email, :password, :family_name, :given_name, :family_name_kana, :given_name_kana, :phone_number, :is_valid)
  end

end
