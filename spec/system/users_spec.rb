require 'rails_helper'

describe 'ユーザー認証のテスト' do
  describe 'ユーザー新規登録' do
    before do
      visit new_user_registration_path
    end
    context '新規登録画面に遷移' do
      it '新規登録に成功する' do
        fill_in 'user[family_name]', with: Faker::Internet.username(specifier: 5)
        fill_in 'user[given_name]', with: Faker::Internet.username(specifier: 5)
        fill_in 'user[family_name_kana]', with: 'カタカナ'
        fill_in 'user[given_name_kana]', with: 'カタカナ'
        fill_in 'user[email]', with: Faker::Internet.email
        fill_in 'user[phone_number]', with: '1234567890'
        fill_in 'user[password]', with: 'password'
        fill_in 'user[password_confirmation]', with: 'password'
        click_button '新規登録'

        expect(page).to have_content 'ご登録ありがとうございます！'
      end
      it '空欄に新規登録に失敗する' do
        fill_in 'user[family_name]',with: ''
        fill_in 'user[given_name]', with: ''
        fill_in 'user[family_name_kana]', with: ''
        fill_in 'user[given_name_kana]', with: ''
        fill_in 'user[email]', with: ''
        fill_in 'user[phone_number]', with: ''
        fill_in 'user[password]', with: ''
        fill_in 'user[password_confirmation]', with: ''
        click_button '新規登録'

        expect(page).to have_content 'エラー'
      end
    end
  end
  describe 'ユーザーログイン' do
    let(:user) { create(:user) }
    before do
      visit new_user_session_path
    end
    context 'ログイン画面に遷移' do
      let(:test_user) { user }
      it 'ログインに成功する' do
        fill_in 'user[email]', with: test_user.email
        fill_in 'user[password]', with: test_user.password
        click_button 'ログイン'

        expect(page).to have_content 'ログインに成功しました。'
      end

      it 'ログインに失敗する' do
        fill_in 'user[email]', with: ''
        fill_in 'user[password]', with: ''
        click_button 'ログイン'

        expect(current_path).to eq(new_user_session_path)
      end
    end
  end
end

