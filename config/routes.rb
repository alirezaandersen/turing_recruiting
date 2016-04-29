Rails.application.routes.draw do

  get 'sessions/new'

  resources :users
  root                'users#index'
  get    'signup'  => 'users#new'
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'

  resources :jobs, only: [:index, :show, :new, :create]
  get    '/jobs/:id/apply' => 'jobs#apply'
  get    '/admin/jobs'     => 'admin#jobs'
  get    '/admin/users'    => 'admin#users'
  get    '/admin/'         => 'admin#index'
end
