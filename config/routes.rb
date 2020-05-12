Rails.application.routes.draw do
  devise_for :users
  get "/", to: "pages#home", as: "root"

  get "/collections", to: "collections#index", as: "collections"
  get "/collections/new", to: "collections#new", as: "new_collection"

  post "/collections", to: "collections#create"
  get "/collections/:id", to: "collections#show", as: "collection"

  # edit/update
  delete "/collections/:id", to: "collections#destroy"

  get "/collections/:id/new", to: "designs#new", as: "new_design"
  post "/collections/:id", to: "designs#create"
  delete "/collections/:id/:id", to: "designs#destroy"
  
end
