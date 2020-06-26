class Favorite < ApplicationRecord
  belongs_to :hotel
  belongs_to :user
end
