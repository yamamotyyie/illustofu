Rails.application.routes.draw do
  devise_for :users
  root to: "illusts#index"
  resources :illusts do
  resources :comments, only: [:create]
  end
end
