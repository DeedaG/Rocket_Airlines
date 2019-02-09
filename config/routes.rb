Rails.application.routes.draw do

  root 'flights#welcome'
  get '/auth/facebook/callback' => 'sessions#create'

  get '/signup', to: 'users#new'
    get '/signin', to: 'sessions#new'
    get '/sessions/destroy' => 'sessions#destroy'
    post '/signin' => 'sessions#create'

    resources :users, only: [:show] do
      resources :bookings, only: [:show, :index]
    end

  resources :users
  resources :bookings
  resources :flights

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
