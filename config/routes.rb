Rails.application.routes.draw do
  root to: 'records#index'
resources :records, only: [:index, :new, :create, :destroy, :edit, :update]
end
