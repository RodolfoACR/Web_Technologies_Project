Rails.application.routes.draw do
  root "home#index"
  get "home/index"
  get "hashtags/index"
  get "hashtags/show"
  get "users/index"
  get "users/show"
  get "profiles/index"
  get "profiles/show"
  get "posts/index"
  get "posts/show"
  resources :posts, only: [:index, :show]
  resources :profiles, only: [:index, :show]
  resources :users, only: [:index, :show]
  resources :hashtags, only: [:index, :show]



  get "up" => "rails/health#show", as: :rails_health_check


end
