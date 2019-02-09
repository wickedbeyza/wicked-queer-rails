Rails.application.routes.draw do
  get 'home/index'

  resources :events, only: [:index, :show]

  root 'home#index'
end
