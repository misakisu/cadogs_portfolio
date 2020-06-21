class CreatePetGenres < ActiveRecord::Migration[5.2]
  def change
    create_table :pet_genres do |t|
      t.string :name, null: false
      t.timestamps
    end
  end
end
