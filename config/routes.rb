Rails.application.routes.draw do
  root 'sessions#new', as: 'login'
<<<<<<< HEAD
  get 'logout' => 'sessions#destroy'
  resources :posts do
    collection  do
       get :search
    end
  end

  resources :users do
    member do
      get :dashbord
=======
  delete 'logout' => 'sessions#destroy'
  resources :users do
    member do
      get :dashbord
    end
  end

  resources :posts do
    collection do
      get :search
>>>>>>> a84907825a29f06668f0fd1d16f84766fc599a5d
    end
  end
  resources :sessions, only: [:new, :create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
