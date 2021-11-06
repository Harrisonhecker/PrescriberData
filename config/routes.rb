Rails.application.routes.draw do
  resources :states
  resources :doctors
  resources :products
  get 'states/index'
  root to: 'states#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
