Rails.application.routes.draw do

  devise_for :users
  get 'cards/index'
  get 'cards/new'
  get 'cards/show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "top#index"
  resources :top ,only: :index
  resources :mypage ,only: :index
  resources :sell ,only: :index
end
