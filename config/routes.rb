Rails.application.routes.draw do
  devise_for :users
  root to: "illusts#index"
  resources :illusts,only:[:new,:create]
end
