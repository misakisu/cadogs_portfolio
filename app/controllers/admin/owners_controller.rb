class Admin::OwnersController < ApplicationController
  before_action :authenticate_admin!

  def index
    @owners = Owner.all.order(created_at: "DESC").page(params[:page]).per(10)
  end

  def edit
    @owner = Owner.find(params[:id])
  end

  def update
    @owner = Owner.find(params[:id])
    if @owner.update(owner_params)
      flash[:success] = "更新されました"
      redirect_to admin_owners_path
    else
      render "edit"
    end
  end

  private
  def owner_params
    params.require(:owner).permit(:email, :name, :phone_number, :is_valid)
  end

end
