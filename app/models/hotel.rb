class Hotel < ApplicationRecord
  has_many :favorites, dependent: :destroy
  has_many :hotel_comments, dependent: :destroy
  has_many :hotel_genre_relations, dependent: :destroy
  has_many :pet_genres, through: :hotel_genre_relations
  has_many :reservations
  belongs_to :owner
  attachment :image
  #検索スピードを考慮してexists?を使用
  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
end
