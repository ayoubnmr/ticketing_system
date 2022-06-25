Rails.application.routes.draw do
  get 'users/index'
post 'users/index'
  resources :project_users
  root 'projects#index2'
  resources :projects   do
     resources :tickets, except: [:index, :show]
  end 
  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  require 'sidekiq/web'
Rails.application.routes.draw do
  mount Sidekiq::Web => '/sidekiq'
end
end
