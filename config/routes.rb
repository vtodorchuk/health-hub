Rails.application.routes.draw do
  default_url_options :host => "localhost:3000" if Rails.env.development?

  mount Notifications::Engine => "/notifications"
  
  devise_for :users
  devise_for :users, as: 'omniauth', controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  resources :users, only: %i[index show edit update]
  resources :medical_cards

  resources :clinics

  resources :chats, shallow: true do
    resources :messages, only: %i[create index destroy update]
  end

  get '/profile', to: 'users#profile'
  get '/profile/dashboard', to: 'dashboard#index'
  get '/profile/medical_card', to: 'medical_cards#profile_medical_card'

  root "home#index"
end
