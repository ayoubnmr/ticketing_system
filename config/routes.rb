require 'sidekiq/web'

Rails.application.routes.draw do
  root 'users#index'
  resources :project_users  
  resources :projects  do
    resources :tickets, except: [:index, :show]
  
end
  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  mount Sidekiq::Web => '/sidekiq'
end
  


