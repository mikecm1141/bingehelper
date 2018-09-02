Rails.application.routes.draw do
  root to: 'dashboard#index'

  get '/login',     to: 'sessions#new'
  post '/login',    to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  namespace :admin do
    resources :shows do
      resources :show_genres, only: %i[create]
    end
    resources :genres
  end

  namespace :settings do
    resources :users, only: %i[show edit update]
  end

  resources :shows, only: %i[show index] do
    namespace :user do
      resources :ratings, only: %i[create destroy]
    end
  end
  resources :genres, only: %i[index show]
  resources :users, only: %i[new create show]
end
