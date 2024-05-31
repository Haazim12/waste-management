Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

  root to: "pages#home", as: :home

  get "/dashboard" => "pages#dashboard", as: :dashboard
  get "calendar" => "pages#calendar", as: :calendar
  get "eliminate/:id" => "wastes#eliminate", as: :eliminate
  patch "wastes/:id/control" => "wastes#control", as: :control
  get "archive" => "pages#archive", as: :archive
  get "new_waste" => "wastes#new", as: :new_waste
  post "create_waste" => "wastes#create", as: :create_waste

  resources :dechets
  resources :wastes

  get "index2" => "wastes#index2", as: :index2
  get "index3" => "wastes#index3", as: :index3
end
