class CollectionsController < ApplicationController
  before_action :set_user_collection, only: [:edit, :update, :destroy]
  before_action :set_collection, only: [:show]

  def index 
    # Code so that collections are sorted by their time of creation
    @collections = Collection.all.sort_by(&:created_at)
  end

  def new
    @collection = Collection.new
  end

  def create
    @collection = current_user.collections.create(collection_params)
    # Ensures there are no errors when creating new collection
    if @collection.errors.any?
      render "new"
    else 
      redirect_to collections_path
    end   
  end

  def show
    # Sets relevant collections and listings
    @collection = Collection.find(params["id"])
    @listings = @collection.listings
  end

  def edit
    @collection = current_user.collections.find_by_id(params["id"])
    # Renders edit if collection matches db
    if @collection 
        render("edit")
    else
        redirect_to collections_path
    end
  end

  def update
    @collection = current_user.collections.find_by_id(params["id"])
    # Updates Collection if collection matches db, and there are no errors
    if @collection 
        @collection.update(collection_params)
        if @collection.errors.any?
            render "edit"
        else
            redirect_to collections_path
        end   
    else
        redirect_to collections_path
    end
  end

  def destroy
    for i in Collection.find(params[:id]).listings
      if i.orders
        i.orders.destroy
      end
    end
    Collection.find(params[:id]).destroy
    
    redirect_to collections_path
  end

  private
  def collection_params
    # Sanitises collection parameters
    params.require(:collection).permit(:title, :description, :picture)
  end

  def set_collection
    # Finds the relevant collection by searching
    @collection = Collection.find(params[:id])
  end

  def set_user_collection
    # Finds the relevant user's collection
    id = params[:id]
    @collection = current_user.collections.find_by_id(id) if current_user
  
    if @collection == nil
        redirect_to collections_path
    end
  end
end

