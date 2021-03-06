class Admin::PetGenresController < ApplicationController
  before_action :authenticate_admin!

  def index
  @pet_genre = PetGenre.new
  @pet_genres = PetGenre.all.order(created_at: "DESC")
  end

  def create
  @pet_genre = PetGenre.new(pet_genre_params)
  @pet_genres = PetGenre.all
  if @pet_genre.save
    flash[:success] = "登録しました"
    redirect_to admin_pet_genres_path
  else
    render "index"
  end
  end

  def destroy
    @pet_genre = PetGenre.find(params[:id])
    if @pet_genre.destroy
      flash[:success] = "削除しました"
      redirect_to admin_pet_genres_path
    end
  end

private
  def pet_genre_params
    params.require(:pet_genre).permit(:name)
  end

end
