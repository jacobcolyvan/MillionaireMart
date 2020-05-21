Rails.application.routes.draw do
  devise_for :users
  #  Routes for pages
  get "/", to: "pages#home", as: "root"
  get "/about", to: "pages#about", as: "about"

  # routes for collections
  get "/collections", to: "collections#index", as: "collections"
  get "/collections/new", to: "collections#new", as: "new_collection"
  post "/collections", to: "collections#create"
  get "/collections/:id", to: "collections#show", as: "collection"

  get "/collections/:id/edit", to: "collections#edit", as: "edit_collection"
  put "/collections/:id", to: "collections#update"
  patch "/collections/:id", to: "collections#update"
  delete "/collections/:id", to: "collections#destroy"

  # routes for listings
  resources :listings
  get "/listings", to: "listings#index", as: "des"
  get "/listings/new", to: "listings#new", as: "new_des"
  post "/listings/:id", to: "listings#create"
  get "/listings/:id", to: "listings#show", as: "desi"

  get "/listings/:id/edit", to: "listings#edit", as: "edit_des"
  put "/listings/:id", to: "listings#update"
  patch "/listings/:id", to: "listings#update"
  delete "/listings/:id", to: "listings#destroy", as: "destroy_des"
  
  # routes for payments/orders
  get "/payments/success", to: "payments#success"
  post "/payments/webhook", to: "payments#webhook"
  get "/orders", to: "orders#index", as: "orders"
end
