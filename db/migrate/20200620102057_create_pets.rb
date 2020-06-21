class CreatePets < ActiveRecord::Migration[5.2]
  def change
    create_table :pets do |t|
      t.integer :user_id, null: false
      t.integer :pet_genre_id, null: false
      t.string  :name, null: false
      t.string  :image_id
      t.boolean :gender, null: false, default: true
      t.timestamps
    end
  end
end
