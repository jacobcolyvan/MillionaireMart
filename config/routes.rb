Rails.application.routes.draw do
  devise_for :users
  get "/", to: "pages#home", as: "root"
  get "/about", to: "pages#about", as: "about"

  get "/collections", to: "collections#index", as: "collections"
  get "/collections/new", to: "collections#new", as: "new_collection"

  post "/collections", to: "collections#create"
  get "/collections/:id", to: "collections#show", as: "collection"

  # edit/update
  get "/collections/:id/edit", to: "collections#edit", as: "edit_collection"
  put "/collections/:id", to: "collections#update"
  patch "/collections/:id", to: "collections#update"
  delete "/collections/:id", to: "collections#destroy"


  resources :listings
  get "/listings", to: "listings#index", as: "des"
  get "/listings/new", to: "listings#new", as: "new_des"
  post "/listings/:id", to: "listings#create"
  get "/listings/:id", to: "listings#show", as: "desi"
  post "/listings/:id", to: "orders#create", as: "orders_path"

  get "/listings/:id/edit", to: "listings#edit", as: "edit_des"
  put "/listings/:id", to: "listings#update"
  patch "/listings/:id", to: "listings#update"
  delete "/listings/:id", to: "listings#destroy"

  get "/payments/success", to: "payments#success"
  post "/payments/webhook", to: "payments#webhook"
  get "/orders", to: "orders#index"
end
