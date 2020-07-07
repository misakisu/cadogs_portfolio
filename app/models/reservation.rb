class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :hotel
  belongs_to :pet
  #バリデーション
  validates :start_date, presence: { message: '入力してください' }
  validates :end_date, presence: { message: '入力してください' }
  validates :pet_id, presence: { message: '入力してください' }
end
