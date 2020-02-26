Rails.application.routes.draw do

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: "users/sessions",
  }
  root to: "exhibitions#index"
  
  resources :categories do
    collection do
      get 'modal'
      get 'search_children'
      get 'search_grandchildren'
    end
  end
  

  resources :exhibitions ,only: [:index, :show, :edit, :new, :create, :update] do
    collection do
      get 'search'
      get 'search_children'
      get 'search_grandchildren'
    end
  end

  
  resources :mypage ,only: :index
  resources :logouts ,only: :index
  resources :paymethods ,only: :indexz1
  resources :addresses ,only: :index
  resources :editmails ,only: :index
  
  resources :cards, only: [:new, :index, :show, :edit, :update] do
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
