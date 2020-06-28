class Admin::PetGenresController < ApplicationController
  def index
  @pet_genre = PetGenre.new
  @pet_genres = PetGenre.all
  end

  def create
  @pet_genre = PetGenre.new(pet_genre_params)
  @pet_genres = PetGenre.all
    if @pet_genre.save!
      flash[:notice] = "登録しました"
      redirect_to admin_pet_genres_path
    else
      render :index
    end
  end

  def destroy
  @pet_genre = PetGenre.find(params[:id])
  if @pet_genre.destroy
    redirect_to admin_pet_genres_path
      flash[:notice] = "削除しました"
    else
      render :index
    end
  end

private
  def pet_genre_params
    params.require(:pet_genre).permit(:name)
  end

end
