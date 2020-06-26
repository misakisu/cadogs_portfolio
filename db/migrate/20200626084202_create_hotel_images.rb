class CreateHotelImages < ActiveRecord::Migration[5.2]
  def change
    create_table :hotel_images do |t|
      t.integer :hotel_id, null: false
      t.string :image_id
      t.timestamps
    end
  end
end
