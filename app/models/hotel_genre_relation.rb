class HotelGenreRelation < ApplicationRecord
  belongs_to :pet_genre
  belongs_to :hotel
end
