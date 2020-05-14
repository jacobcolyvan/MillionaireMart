Rails.application.routes.draw do
  devise_for :users
  get "/", to: "pages#home", as: "root"

  get "/collections", to: "collections#index", as: "collections"
  get "/collections/new", to: "collections#new", as: "new_collection"

  post "/collections", to: "collections#create"
  get "/collections/:id", to: "collections#show", as: "collection"

  # edit/update
  get "/collections/:id/edit", to: "collections#edit", as: "edit_collection"
  put "/collections/:id", to: "collections#update"
  patch "/collections/:id", to: "collections#update"
  delete "/collections/:id", to: "collections#destroy"


  resources :designs
  get "/designs/new", to: "designs#new", as: "new_des"
  post "/designs/:id", to: "designs#create"

  get "/designs/:id/edit", to: "collections#edit", as: "edit_des"
  put "/designs/:id", to: "collections#update"
  patch "/designs/:id", to: "collections#update"
  delete "/designs/:id", to: "designs#destroy"
end
