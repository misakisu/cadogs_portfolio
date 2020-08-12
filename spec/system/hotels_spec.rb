require 'rails_helper'

describe '投稿のテスト' do
  let(:owner) { create(:owner) }
  let!(:owner2) { create(:owner) }
  let!(:hotel) { create(:hotel, owner: owner) }
  let!(:hotel2) { create(:hotel, owner: owner2) }
  before do
    visit new_owner_session_path
  	fill_in 'owner[email]', with: owner.email
  	fill_in 'owner[password]', with: owner.password
  	click_button 'ログイン'
    visit new_owner_hotel_path
  end
  describe 'ホテル新規投稿のテスト' do
		context 'ホテル新規投稿の確認' do
		  it '投稿に成功する' do
		  	fill_in 'hotel[name]', with: Faker::Lorem.characters(number:5)
		  	fill_in 'hotel[price]', with: Faker::Lorem.characters(number:20)
        fill_in 'hotel[address]', with: Faker::Lorem.characters(number:20)
		  	fill_in 'hotel[phone_number]', with: Faker::Lorem.characters(number:20)
        fill_in 'hotel[introduction]', with: Faker::Lorem.characters(number:20)
        click_button '申請する'
		  	expect(page).to have_content 'ホテル情報が申請されました！'
		  end
		  it '投稿に失敗する' do
		  	click_button '申請する'
		  	expect(page).to have_content 'エラー'
		  	expect(current_path).to eq('/owner/hotels')
		  end
		end
  end

  describe '編集のテスト' do
  	context 'Ownerのホテル編集画面への遷移' do
  	  it '遷移できる' do
	  		visit edit_owner_hotel_path(hotel)
	  		expect(current_path).to eq('/owner/hotels/' + hotel.id.to_s + '/edit')
	  	end
	  end
		context '他人の投稿の編集画面への遷移' do
		  it '遷移できない' do
		    visit edit_owner_hotel_path(hotel2)
		    expect(current_path).to eq('/owner')
		  end
		end
		context 'フォームの確認' do
			before do
        visit edit_owner_hotel_path(hotel)
      end
      it '編集に成功する' do
				visit edit_owner_hotel_path(hotel)
				click_button '変更内容を保存する'
				expect(page).to have_content 'ホテル情報が更新されました！'
				expect(current_path).to eq '/owner'
			end
			it '編集に失敗する' do
				visit edit_owner_hotel_path(hotel)
				fill_in 'hotel[name]', with: ''
				click_button '変更内容を保存する'
				expect(page).to have_content 'エラー'
				expect(current_path).to eq '/owner/hotels/' + hotel.id.to_s
			end
		end
	end
end