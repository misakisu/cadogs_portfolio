class PetsController < ApplicationController
  before_action :authenticate_user!

  def index
    @pet = Pet.new
    #現在のユーザーのペットを表示
    @user = current_user
    @pets = @user.pets.page(params[:page]).per(5)
  end

  def create
    @pet = current_user.pets.new(pet_params)
      if @pet.save
      end
    @pets = current_user.pets#非同期部分テンプレートの変数のため
  end
  #浅くネストしているため、以下Idが情報取得に必要。
  def edit
    @pet = Pet.find(params[:id])
    if current_user.id != @pet.user.id
      redirect_to user_pets_path
    end
  end

  def update
    @pet = Pet.find(params[:id])
    if @pet.update(pet_params)
      flash[:success] = "ペット情報が更新されました！"
      redirect_to user_pets_path
    else
    	render "edit"
    end
  end

  def destroy
    @pet = Pet.find(params[:id])
    if @pet.destroy
      flash[:success] = "ペット情報が削除されました"
      redirect_to user_pets_path
    end
    @pets = current_user.pets#非同期部分テンプレートの変数のため
  end

private
  def pet_params
    params.require(:pet).permit(:user_id, :pet_genre_id, :name, :image, :gender)
  end
end

