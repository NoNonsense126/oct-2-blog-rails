Rails.application.routes.draw do
  # get '/blogs', to: "blogs#index"
  # get '/blogs/new', to: "blogs#new"
  resources :blogs

end
