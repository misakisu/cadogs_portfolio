class HotelGenreRelation < ApplicationRecord
  belongs_to :hotel
  belongs_to :pet_genre
end
