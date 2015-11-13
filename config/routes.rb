Rails.application.routes.draw do
  # get '/blogs', to: "blogs#index"
  # get '/blogs/new', to: "blogs#new"
  # get '/', to: "blogs#index"
  root "blogs#index"
  resources :blogs

  get "/signup", to: "users#new", as: "signup"
  resource :users, only: :create

  get "/login", to: "sessions#new", as: "login"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy", as: "logout"
end
