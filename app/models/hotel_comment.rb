class HotelComment < ApplicationRecord
  belongs_to :hotel
  belongs_to :user
  #バリデーション
  validates :comment, presence: { message:"を入力してください"}
end
