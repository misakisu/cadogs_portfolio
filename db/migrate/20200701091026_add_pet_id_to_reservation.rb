class AddPetIdToReservation < ActiveRecord::Migration[5.2]
  def change
    add_column :reservations, :pet_id, :integer
  end
end
