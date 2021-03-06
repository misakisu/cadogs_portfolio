class Pet < ApplicationRecord
  belongs_to :user
  belongs_to :pet_genre
  has_many   :reservations
  attachment :image
  #genderを定義
  enum gender:{
    男の子: 0,
    女の子: 1
  }
  #バリデーション
  validates :name, presence: { message:"を入力してください"}
  validates :gender, presence: { message:"を入力してください"}
end
