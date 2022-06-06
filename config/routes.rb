Rails.application.routes.draw do
  get 'tickets/index'
  get 'tickets/new'
  get 'users/index'
  get  'tickets/edit'
  get  'ticket/update'
  post 'tickets/new'
  post 'prjects/new'
  resources :project_users
  root 'users#index'
  resources :projects   do
     resources :tickets
  end 
  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
