Rails.application.routes.draw do
  resources :posts
  root 'sessions#new', as: 'login'
  delete 'logout' => 'sessions#destroy'

  resources :users
  resources :sessions, only: [:new, :create, :destroy]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
