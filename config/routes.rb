Rails.application.routes.draw do
  devise_for :users
  root 'home#index'
  resources :stations do
    resources :reviews
  end
  resources :votes, only: [:create]

  namespace :api do
    namespace :v1 do
      resources :votes, only: [:create]
    end
  end
end
