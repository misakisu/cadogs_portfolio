# frozen_string_literal: true

class OwnerDevises::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
  before_action :reject_owner, only: [:create]
  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
  def after_sign_in_path_for(resource)
    flash[:success] = "ログインに成功しました。"
    owner_path
  end
  def after_sign_out_path_for(resource)
    flash[:success] = "ログアウトに成功しました。"
    owner_home_path
  end
  protected
  def reject_owner#退会済みのメッセージ表示
    @owner = Owner.find_by(email: params[:owner][:email].downcase)
    if @owner
      if (@owner.valid_password?(params[:owner][:password]) && (@owner.active_for_authentication? == false))
        flash[:error] = "退会済みです。"
        redirect_to new_owner_session_path
      end
    else
      flash[:error] = "必須項目を入力してください。"
      redirect_to new_owner_session_path
    end
  end
end
