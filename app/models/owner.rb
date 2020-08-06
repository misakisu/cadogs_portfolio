class Owner < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :hotels, dependent: :destroy
  validates :name, presence: { message: "を入力してください" }
  validates :phone_number, numericality: {only_integer: true,message:"を入力してください"},format:{with: /\A\d{10,11}\z/,message: "ハイフン無し10桁or11桁で入力して下さい。"}
  validates :email, presence: true, uniqueness: { message:":入力されたアドレスは既に登録されています"}, on: :create
  #{AZ}はハイフン無し
  #退会済みのアカウントをはじく
  def active_for_authentication?
  super && (self.is_valid == true)
  end
end