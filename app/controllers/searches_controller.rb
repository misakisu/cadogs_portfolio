class SearchesController < ApplicationController

  def search
  	@pet_genres = PetGenre.all
    @column = params[:column]
    @content = params[:content]
    @records = search_for(@column, @content)
  end

  private
    def search_for(column, content)
      if column == "name"
        Hotel.where(is_valid: "true").where('name LIKE ?', '%'+content+'%')
      elsif column == "address"
        Hotel.where(is_valid: "true").where('address LIKE ?', '%'+content+'%')
      elsif column == "introduction"
        Hotel.where(is_valid: "true").where('introduction LIKE ?', '%'+content+'%')
      end
    end
end
