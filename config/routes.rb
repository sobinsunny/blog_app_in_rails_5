Rails.application.routes.draw do
  root 'users#new', as: 'home'

  resources :users

  resources :sessions, only: [] do
    collection do
      post :login
      get  :logout
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
