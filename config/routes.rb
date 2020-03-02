Rails.application.routes.draw do

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: "users/sessions",
  }
  root to: "exhibitions#index"
  
  resources :categories do
    collection do
      get 'search_children'
      get 'search_grandchildren'
    end
  end
  # resources :categories doに7つのアクションがないと指摘を受けました。対応をお願いします  

  resources :exhibitions ,except: :destroy do
    collection do
      get 'modal'
      get 'search'
      get 'search_children'
      get 'search_grandchildren'
      get 'done'
    end
    member do
      get 'buy'
      post 'pay'
    end
  end

  
  resources :mypage ,only: :index
  resources :logouts ,only: :index
  resources :paymethods ,only: :index
  resources :addresses ,only: :index
  resources :editmails ,only: :index
  
  resources :cards, only: [:new, :index, :show, :edit, :update] do
    collection do
      post 'pay', to: 'cards#pay'
      post 'delete', to: 'cards#delete'
    end
  end
  resources :images ,only: :index

end
