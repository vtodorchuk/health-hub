Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  default_url_options host: 'localhost:3000' if Rails.env.development?

  mount Notifications::Engine => '/notifications'

  root 'home#index'

  devise_for :users

  resources :clinics, only: :index

  resource :clinic do
    get 'users', to: 'users#index'

    resources :users, only: %i[show update edit] do
      resources :bookings do
        put 'accept', to: 'bookings#accept'
        put 'cancel', to: 'bookings#cancel'
      end
      resources :services
      resources :patients
      resources :reports do
        resources :medicines, only: %i[index new create]
        resources :analyzes, only: %i[index new create]
        resources :examinations, only: %i[index new create]
      end

      get '/statistic', to: 'reports#statistic'
    end

    resources :medical_cards

    resources :chats, shallow: true do
      resources :messages, only: %i[create index destroy update]
    end

    get '/profile', to: 'users#profile'
    get '/profile/dashboard', to: 'dashboard#index'
    get '/profile/medical_card', to: 'medical_cards#profile_medical_card'
  end
end
