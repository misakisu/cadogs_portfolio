class PetGenre < ApplicationRecord
  has_many :hotel_genre_relations
  has_many :hotels, through: :hotel_genre_relations #throughを通してhotelのidと結合。
  has_many :pets
  belongs_to :admin, optional: true
  #バリデーション
  validates :name, presence: { message:"を入力してください"}
end
