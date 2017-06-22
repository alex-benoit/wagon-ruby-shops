Rails.application.routes.draw do
  root to: 'companies#index'
  post '/', to: 'companies#create'
end
