class CreateHotelComments < ActiveRecord::Migration[5.2]
  def change
    create_table :hotel_comments do |t|
      t.integer :user_id, null: false
      t.integer :hotel_id, null: false
      t.text    :comment, null: false
      t.timestamps
    end
  end
end
