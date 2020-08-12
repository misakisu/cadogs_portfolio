require 'rails_helper'

describe 'ヘッダーのテスト' do
  describe 'ログインしていない場合' do
    before do
      visit root_path
    end
    context 'ヘッダーのリンクを確認' do
      subject { page }
      it 'ホテル一覧画面に遷移する' do
        click_link "ホテルを見る"
        visit hotels_path
      end
      it '新規登録画面に遷移する' do
        click_link "お客様登録"
        visit new_user_registration_path
      end
      it 'ログイン画面に遷移する' do
        click_link "お客様ログイン"
        visit new_user_session_path
      end
    end
  end

  describe 'ログインしている場合' do
    let(:user) { create(:user) }
    before do
      visit new_user_session_path
      fill_in 'user[email]', with: user.email
      fill_in 'user[password]', with: user.password
      click_button "ログイン"
    end
    context 'ヘッダーのリンクを確認' do
      subject { current_path }
      it 'ホテル一覧画面に遷移する' do
        click_link "ホテル一覧"
        visit hotels_path
      end
      it 'マイページに遷移する' do
        click_link "マイページ"
        visit user_path(user)
      end
      it 'マイペット画面に遷移する' do
        click_link "マイペット"
        visit user_pets_path(user)
      end
      it 'ログアウトする' do
        click_link "サインアウト"
        expect(page).to have_content "ログアウトに成功しました。"
      end
    end
  end
end
