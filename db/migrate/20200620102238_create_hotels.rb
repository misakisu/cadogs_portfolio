class CreateHotels < ActiveRecord::Migration[5.2]
  def change
    create_table :hotels do |t|
      t.integer :owner_id, null: false
      t.string  :name, null: false
      t.integer :price, null: false
      t.string  :address, null: false
      t.string  :phone_number, null: false
      t.string  :image_id
      t.text    :introduction
      t.boolean  :is_valid, null: false, default: false
      t.timestamps
    end
  end
end
