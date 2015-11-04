Rails.application.routes.draw do
  get '/registro' => 'registration#new', as: :signup
end
