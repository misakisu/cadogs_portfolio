class Owner < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :hotels, dependent: :destroy
  #退会済みのアカウントをはじく
  def active_for_authentication?
  super && (self.is_valid == true)
  end
end