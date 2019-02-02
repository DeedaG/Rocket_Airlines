Rails.application.routes.draw do
  resources :bookings
  resources :flights

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'bookings#index'
end
