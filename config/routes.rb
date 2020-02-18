Rails.application.routes.draw do

  devise_for :users
  root to: "top#index"
  resources :mypage ,only: :index
  resources :logouts ,only: :index
  resources :paymethods ,only: :index
  resources :addresses ,only: :index
  resources :editmails ,only: :index
  resources :sell ,only: :index
  # resources :cards ,only: [:index, :new, :create, :show]
  resources :card, only: [:new, :show] do
    collection do
      post 'show', to: 'card#show'
      post 'pay', to: 'card#pay'
      post 'delete', to: 'card#delete'
    end
  end
end
