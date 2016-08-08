Rails.application.routes.draw do
  root 'sessions#new', as: 'login'
  get 'logout' => 'sessions#destroy'
  resources :posts
  resources :users do
    member do
      get :dashbord
    end
  end
  resources :sessions, only: [:new, :create]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
