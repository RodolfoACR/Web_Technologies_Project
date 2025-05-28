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
  
  resources :posts, only: [:index, :show]
  resources :profiles, only: [:index, :show] do
    resources :posts, only: [:new, :create, :edit, :update, :destroy]
  end
  resources :users, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  resources :hashtags, only: [:index, :show]



  get "up" => "rails/health#show", as: :rails_health_check


end
