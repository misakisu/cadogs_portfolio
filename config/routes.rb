Rails.application.routes.draw do
  #top画面のルート
  root to: 'home#top'
  get '/about'=>'home#about'
  get '/learn'=>'home#learn'

  #userデバイスのルート
  devise_for :users, controllers: {
    sessions: "user_devises/sessions",
    registrations: "user_devises/registrations",
    passwords: "user_devises/passwords"
  }
  #userのルート petsとreservationsネスト
  resource :user, only: [:show], shallow: true do
    resources :pets, only: [:index, :create, :edit, :update, :destroy]
    resources :reservations, only: [:create, :index] do
      post 'confirm', on: :collection
      get 'finish', on: :collection
    end
    get 'confirm', on: :collection
    put 'hide', on: :collection
  end

  #hotelのルート(User以外にも閲覧可能) commentsとfavoritesネスト
  resources :hotels, only: [:show, :index], shallow: true do
    resources :hotel_comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end

  #ownerデバイス
  devise_for :owners, controllers: {
    sessions: "owner_devises/sessions",
    registrations: "owner_devises/registrations",
    passwords: "owner_devises/passwords"
  }

  #on: :collectionでグループ化
  resource :owner, only: [:show, :edit, :update] do
    get 'confirm', on: :collection
    put 'hide', on: :collection
  end

  namespace :owner do
    get 'home' => 'home#top'
    resources :hotels
    resources :reservations, only: [:index, :destroy]
  end

  #adminデバイス
  devise_for :admins, controllers: {
    sessions: "admin_devises/sessions",
    registrations: "admin_devises/registrations",
    passwords: "admin_devises/passwords"
  }

  #adminグループアクション
  namespace :admin do
    resources :users, only: [:index, :edit, :update]
    resources :owners, only: [:index, :edit, :update]
    resources :pet_genres, only: [:index, :create, :destroy]
    resources :hotels
  end
end
