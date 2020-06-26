class CreateHotelGenreRelations < ActiveRecord::Migration[5.2]
  def change
    create_table :hotel_genre_relations do |t|
      t.references :hotel, foreign_key: true
      t.references :pet_genre, foreign_key: true

      t.timestamps
    end
  end
end
