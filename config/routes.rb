Rails.application.routes.draw do
  root to: 'home#index'

  get '/registro' => 'registration#new', as: :signup
  post '/registro' => 'registration#create', as: :registration
end
