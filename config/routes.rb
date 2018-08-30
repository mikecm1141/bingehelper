Rails.application.routes.draw do
  root to: 'dashboard#index'

  get '/login',     to: 'sessions#new'
  post '/login',    to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  namespace :admin do
    resources :shows
  end

  namespace :settings do
    resources :users, only: %i[show edit update]
  end

  resources :users, only: %i[new create show]
end
