Rails.application.routes.draw do

  get 'sessions/new'

  root                'users#index'

  get    'signup'  => 'users#new'
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
  resources :users
  resources :jobs, only: [:index, :show, :new, :create]
end
