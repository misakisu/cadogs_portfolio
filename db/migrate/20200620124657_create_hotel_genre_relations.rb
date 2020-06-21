class CreateHotelGenreRelations < ActiveRecord::Migration[5.2]
  def change
    create_table :hotel_genre_relations do |t|
      t.integer :pet_genre_id, null: false
      t.integer :hotel_id, null: false
      t.timestamps
    end
  end
end
