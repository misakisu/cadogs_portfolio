require 'rails_helper'

RSpec.describe 'Userモデルのテスト', type: :model do
  # 名前が空欄で登録できない→名前を空欄で登録したらfalse
  # フリガナをカタカナ以外で登録できない→名前をカタカナ以外で登録したらfalse
  # 電話番号を数字以外と11桁以上で登録できない→電話番号を数字以外と11桁以上で登録したらfalse
  # メールアドレスを空欄で登録できない→メールアドレスを空欄で登録したらfalse
  # バリデーションしていない状態で失敗→設定したら成功
  # エラーメッセージがなければ失敗

  describe 'バリデーションのテスト' do
    let(:user) { build(:user) }
    subject { test_user.valid? }
    context 'family_nameカラム' do
      let(:test_user) { user }
      it '空欄でないこと' do
        test_user.family_name = ''
        is_expected.to eq false;
      end
    end

    context 'given_nameカラム' do
      let(:test_user) { user }
      it '空欄でないこと' do
        test_user.given_name = ''
        is_expected.to eq false;
      end
    end

    context 'family_name_kanaカラム' do
      let(:test_user) { user }
      it '空欄でないこと' do
        test_user.family_name_kana = ''
        is_expected.to eq false;
      end
      it 'カタカナであること' do
        expect(test_user.family_name_kana).to eq 'カタカナ'
      end
      it 'カタカナでない場合のエラーメッセ―ジ' do
        test_user.family_name_kana = 'ひらがな'
        is_expected.to eq false;
        expect(user.errors[:family_name_kana]).to include("カタカナのみで入力して下さい")
      end
    end

    context 'given_name_kanaカラム' do
      let(:test_user) { user }
      it '空欄でないこと' do
        test_user.given_name_kana = ''
        is_expected.to eq false;
      end
      it 'カタカナであること' do
        expect(test_user.given_name_kana).to eq 'カタカナ'
      end
        it 'カタカナでない場合のエラーメッセ―ジ' do
        test_user.given_name_kana = 'ひらがな'
        is_expected.to eq false;
        expect(user.errors[:given_name_kana]).to include("カタカナのみで入力して下さい")
      end
    end

    context 'emailカラム' do
      let(:test_user) { user }
      it '空欄でないこと' do
        test_user.email = ''
        is_expected.to eq false;
      end
    end

    context 'phone_numberカラム' do
      let(:test_user) { user }
      it '数字であること' do
        expect(test_user.phone_number).to eq '1234567890'
      end
      it '10桁もしくは11桁でない場合のエラーメッセージ' do
        test_user.phone_number = '12345'
        is_expected.to eq false
        expect(user.errors[:phone_number]).to include("10桁or11桁で入力してください")
      end
    end
  end
end