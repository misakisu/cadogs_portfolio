class Admin::OwnersController < ApplicationController
  def index
    @owners = Owner.all
  end

  def edit
    @owner = Owner.find(params[:id])
  end

  def update
    @owner = Owner.find(params[:id])
    if @owner.update(owner_params)
      redirect_to admin_owners_path
      flash[:notice] = "更新されました"
    else
      render "edit"
    end
  end

  private
  def owner_params
    params.require(:owner).permit(:email, :name, :phone_number, :is_valid)
  end

end
