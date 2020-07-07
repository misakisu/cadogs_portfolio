class PetsController < ApplicationController
  def index
    @pet = Pet.new
    #現在のユーザーのペットを表示
    @user = current_user
    @pets = @user.pets
  end

  def create
    @pet = current_user.pets.new(pet_params)
    if @pet.save
      flash[:success] = "ペット情報が保存されました！"
      #redirect_to user_pets_path
    else
    	render "index"
    end
    @pets = current_user.pets#非同期部分テンプレートの変数のため???????
  end
  #浅くネストしているため、以下Idが情報取得に必要。
  def edit
    @pet = Pet.find(params[:id])
  end

  def update
    @pet = Pet.find(params[:id])
    if @pet.update(pet_params)
      flash[:success] = "ペット情報が更新されました！"
      redirect_to user_pets_path
    else
    	render "index"
    end
  end

  def destroy
    @pet = Pet.find(params[:id])
    if @pet.destroy
      flash[:success] = "ペット情報が保存されました！"
    else
    	render "index"
    end
    @pets = current_user.pets#非同期部分テンプレートの変数のため
  end

private
  def pet_params
    params.require(:pet).permit(:user_id, :pet_genre_id, :name, :image, :gender)
  end
end

