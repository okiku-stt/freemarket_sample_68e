Rails.application.routes.draw do

  devise_for :users
  root to: "top#index"
  resources :categories do
    collection do
      get 'search_children'
      get 'search_grandchildren'
    end
  end
  resources :mypage ,only: :index
  resources :logouts ,only: :index
  resources :paymethods ,only: :index
  resources :addresses ,only: :index
  resources :editmails ,only: :index
  resources :sell ,only: :index
  resources :cards ,only: [:index, :new, :create, :show]

end
