Rails.application.routes.draw do
  namespace :admin do
    resources :shows
  end
end
