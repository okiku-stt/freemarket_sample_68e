Rails.application.routes.draw do

  devise_for :users
  root to: "top#index"
  resources :mypage ,only: :index
  resources :logouts ,only: :index
  resources :paymethods ,only: :index
  resources :addresses ,only: :index
  resources :editmails ,only: :index
  resources :sell, only: :index
  resources :buy ,only: :index
  resources :exhibitions ,only: [:index, :new, :create]
  resources :images ,only: :index
  resources :cards ,only: [:index, :new, :create, :show]

end
