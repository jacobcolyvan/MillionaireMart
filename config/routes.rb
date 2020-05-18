Rails.application.routes.draw do
  get 'carts/show'
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


  resources :designs
  get "/designs", to: "designs#index", as: "des"
  get "/designs/new", to: "designs#new", as: "new_des"
  post "/designs/:id", to: "designs#create"
  get "/designs/:id", to: "designs#show", as: "desi"

  get "/designs/:id/edit", to: "designs#edit", as: "edit_des"
  put "/designs/:id", to: "designs#update"
  patch "/designs/:id", to: "designs#update"
  delete "/designs/:id", to: "designs#destroy"

  get "/payments/success", to: "payments#success"
end
