Rails.application.routes.draw do

  get 'sessions/new'

  resources :users
  root                'users#index'
  get    'signup'  => 'users#new'
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'

  resources :jobs, only: [:index, :show, :new, :create, :update]
  get    '/jobs/:id/apply' => 'jobs#apply'
  get    '/jobs/admin'     => 'jobs#admin'
  get    '/users/admin'    => 'users#admin'
  get    '/admin/'         => 'admin#index'
end
