class Hotel < ApplicationRecord
  has_many :favorites, dependent: :destroy
  has_many :hotel_comments, dependent: :destroy
  has_many :hotel_genre_relations, dependent: :destroy
  has_many :pet_genres, through: :hotel_genre_relations
  has_many :reservations
  has_many :hotel_images, dependent: :destroy
  belongs_to :owner
  attachment :image
  #refile複数画像投稿用に下記記述
  accepts_attachments_for :hotel_images, attachment: :image
  #バリデーション
  validates :name, presence: { message:"を入力してください"}
  validates :price, presence: { message:"を入力してください"}
  validates :address, presence: { message:"を入力してください"}
  validates :phone_number, presence: { message:"を入力してください"}
  validates :hotel_images, length:{ maximum: 6, message:"は6枚まで投稿可能です" }
  #検索スピードを考慮してexists?を使用
  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
end
