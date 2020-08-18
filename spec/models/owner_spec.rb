require 'rails_helper'

RSpec.describe 'Ownerモデルのテスト', type: :model do
  # 名前が空欄で登録できない→名前を空欄で登録したらfalse
  # 電話番号を数字以外と11桁以上で登録できない→電話番号を数字以外と11桁以上で登録したらfalse
  # メールアドレスを空欄で登録できない→メールアドレスを空欄で登録したらfalse
  # バリデーションしていない状態で失敗→設定したら成功
  # エラーメッセージがなければ失敗

  describe 'バリデーションのテスト' do
    let(:owner) { build(:owner) }
    subject { test_owner.valid? }
    context 'nameカラム' do
      let(:test_owner) { owner }
      it '空欄でないこと' do
        test_owner.name = ''
        is_expected.to eq false;
      end
    end

    context 'emailカラム' do
      let(:test_owner) { owner }
      it '空欄でないこと' do
        test_owner.email = ''
        is_expected.to eq false;
      end
    end

    context 'phone_numberカラム' do
      let(:test_owner) { owner }
      it '数字であること' do
        test_owner.phone_number = '0123456789'
        is_expected.to eq true;
      end
      it '10桁もしくは11桁でない場合のエラーメッセージ' do
        test_owner.phone_number = '12345'
        expect(owner.errors[:phone_number]).to include("10桁or11桁で入力して下さい")
      end
    end
  end
end