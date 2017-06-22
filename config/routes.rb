Rails.application.routes.draw do
  root to: 'companies#index'

  resources :companies, only: [:index, :new, :create, :edit, :update]
end
