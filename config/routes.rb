Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :top ,only: :index
  resources :mypage ,only: :index
  resources :sell ,only: :index

end
