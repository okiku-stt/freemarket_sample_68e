Rails.application.routes.draw do

  devise_for :users
  root to: "top#index"
  resources :mypage ,only: :index
  resources :logouts ,only: :index
  resources :paymethods ,only: :index
  resources :addresses ,only: :index
  resources :editmails ,only: :index
  resources :sell ,only: :index
  resources :cards ,only: [:index,:new,:show]
end
