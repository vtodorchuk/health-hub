Rails.application.routes.draw do
  default_url_options host: 'localhost:3000' if Rails.env.development?

  mount Notifications::Engine => '/notifications'

  devise_for :users

  resources :users, only: %i[show update edit] do
    resources :bookings do
      put 'accept', to: 'bookings#accept'
      put 'cancel', to: 'bookings#cancel'
    end
    resources :services
    resources :patients
  end

  resources :medical_cards

  resources :clinics do
    get 'users', to: 'users#index'
  end

  resources :chats, shallow: true do
    resources :messages, only: %i[create index destroy update]
  end

  get '/profile', to: 'users#profile'
  get '/profile/dashboard', to: 'dashboard#index'
  get '/profile/medical_card', to: 'medical_cards#profile_medical_card'

  root 'home#index'
end
