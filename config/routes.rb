Rails.application.routes.draw do
  root 'sessions#new', as: 'login'
  delete 'logout' => 'sessions#destroy'

  resources :users do
    resources :posts
  	member do
		  get :dashbord 
    end
  end
  resources :sessions, only: [:new, :create, :destroy]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
