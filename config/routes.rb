Rails.application.routes.draw do
  devise_for :users
  root to: 'records#index'
  resources :users, only: :show
  resources :records do
    resources :comments, only: :create
    collection do
      get 'search'
    end
  end
  resources :rooms, only: [:new, :create]
end
