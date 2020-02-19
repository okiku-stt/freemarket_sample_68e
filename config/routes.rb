Rails.application.routes.draw do

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: "users/sessions",
  } 
  root to: "top#index"
  resources :exhibitions ,only: [:index, :new, :create, :show, :destroy, :edit, :update]
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
  resources :buy ,only: :index
  # resources :exhibitions ,only: [:index, :destroy, :edit, :update]
  resources :images ,only: :index
  resources :cards ,only: [:index, :new, :create, :show]


end
