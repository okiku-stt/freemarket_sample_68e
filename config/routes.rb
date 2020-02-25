Rails.application.routes.draw do

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: "users/sessions",
  }
  root to: "exhibitions#index"

  resources :exhibitions ,only: [:index, :show, :new, :create, :edit, :update] do
    collection do
      get 'modal'
      get 'category_children' 
      get 'category_grandchildren'
    end
  end

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

  resources :cards, only: [:new, :index, :show] do
    collection do
      # post 'index', to: 'cards#index'
      post 'show', to: 'cards#show'
      post 'pay', to: 'cards#pay'
      post 'delete', to: 'cards#delete'
    end
  end
  resources :buy ,only: :index
  resources :images ,only: :index

end
