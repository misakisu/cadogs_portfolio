class HotelImage < ApplicationRecord
  belongs_to :hotel
  attachment :image
  $image_par_article = 3
end
