class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :pets, dependent: :destroy
  has_many :reservations, dependent: :destroy
  has_many :favorites
  has_many :hotel_comments
  #バリデーション
  validates :family_name, presence: true, allow_blank: true
  validates :given_name, presence: true, allow_blank: true
  validates :family_name_kana, presence: true,format: {with: /\A[\p{katakana} ー－&&[^ -~｡-ﾟ]]+\z/,message: "全角カタカナのみで入力して下さい", allow_blank: true}
  validates :given_name_kana, presence: true,format: {with: /\A[\p{katakana} ー－&&[^ -~｡-ﾟ]]+\z/,message: "全角カタカナのみで入力して下さい", allow_blank: true}
  validates :phone_number, numericality: {only_integer: true,message:"入力してください"},format:{with: /\A\d{10,11}\z/,message: "ハイフン無し10桁or11桁で入力して下さい。", allow_blank: true}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true ,format:{with: VALID_EMAIL_REGEX, allow_blank: true}, uniqueness: true
  #「〇〇＠〇.〇」という形式で入力して下さい。
  #エラー文の重複を防ぐ allow_blank: true
  #退会済みのアカウントをはじく
  def active_for_authentication?
  super && (self.is_valid == true)
  end
end
