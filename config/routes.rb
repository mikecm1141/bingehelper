Rails.application.routes.draw do
  root to: 'dashboard#index'
  
  get '/login',     to: 'sessions#new'
  post '/login',    to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  namespace :admin do
    resources :shows
  end

  resources :users, only: %i[new create]
end
