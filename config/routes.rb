Rails.application.routes.draw do

  root "home#index"
  get "/search" => "home#search"

  resources :sessions, only: [:new, :create, :destroy]

  resources :bookings

  resources :users do
    resources :bookings, only: [:show]
  end

  resources :rides do
    resources :bookings
    delete 'completed' => "rides#complete"
  end

end
