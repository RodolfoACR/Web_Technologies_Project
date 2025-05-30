Rails.application.routes.draw do

  root "home#index"
  get "home/index"

  get "hashtags/index"
  get "hashtags/show"
  
  get "users/index"
  get "users/show"
  get "users/new"
  get "users/create"
  get "users/edit"
  get "users/update"
  get "users/destroy"

  get "profiles/index"
  get "profiles/show"
  
  get "posts/index"
  get "posts/show"
  
  resources :profiles, only: [:index, :show, :new, :create, :edit, :update, :destroy] 
  resources :posts, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  resources :users, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  resources :hashtags, only: [:index, :show]
  resources :comments, only: [:edit, :update, :destroy]




  get "up" => "rails/health#show", as: :rails_health_check


end
