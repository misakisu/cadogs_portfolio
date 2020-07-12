require "date"#dateモジュール
class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :hotel
  belongs_to :pet
  #バリデーション
  validates :start_date, presence: { message: '入力してください' }
  validates :end_date, presence: { message: '入力してください' }
  validates :pet_id, presence: { message: '様を入力してください' }
  validate :correct_date

  #チェックアウトの日程がチェックインの日程よりも前の日程で入力された場合は下記エラーを表示
  def correct_date
    errors.add(:end_date, 'チェックアウトの日程が間違っています') if end_date < start_date
  end
end
