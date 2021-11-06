Rails.application.routes.draw do
  resources :states
  resources :doctors
  resources :products
  get 'products/index'
  root to: 'products#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
