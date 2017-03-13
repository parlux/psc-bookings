Rails.application.routes.draw do
  devise_for :users
  root to: 'home#index'

  get '/admin', to: 'admin/dashboard#index'

  resources :bookings, only: [ :new, :create, :show ]
end
