Rails.application.routes.draw do
  devise_for :users
  root 'home#index'
  resources :stations do
    resources :reviews
  end
end
