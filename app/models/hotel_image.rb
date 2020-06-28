class HotelImage < ApplicationRecord
  belongs_to :hotel
  attachment :image
end
