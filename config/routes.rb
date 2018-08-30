Rails.application.routes.draw do
  namespace :admin do
    resources :shows, only: %i[new create show]
  end
end
