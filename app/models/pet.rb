class Pet < ApplicationRecord
  belongs_to :user
  belongs_to :pet_genre
  attachment :image
  #genderを定義
  enum gender:{
    男の子: 0,
    女の子: 1
  }
end
