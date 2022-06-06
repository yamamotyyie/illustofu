Rails.application.routes.draw do
  # deviseの時に使う
  devise_for :users
  # トップページへのルート
  root to: "illusts#index"
  # userの詳細機能のみをresourcesから取り出す
  resources :users , only:[:show]
  # イラストにコメントをネスト。どのイラストにコメントをつけるか
  resources :illusts do
  resources :comments, only: [:create]
  end
end
