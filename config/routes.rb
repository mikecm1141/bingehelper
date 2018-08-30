Rails.application.routes.draw do
  root to: 'dashboard#index'

  namespace :admin do
    resources :shows
  end

  resources :users, only: %i[new create]
end
