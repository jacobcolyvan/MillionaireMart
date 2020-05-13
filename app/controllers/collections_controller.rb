class CollectionsController < ApplicationController
  before_action :authenticate_user!

  def index 
    @collections = Collection.all
  end

  def new
    @collection = Collection.new

    
  end

  def create
    @collection = current_user.collection.create(collection_params)
    if @collection.errors.any?
      render "new"
    else 
      redirect_to collections_path
    end   
  end

  def show
    @collection = Collection.find(params["id"])
    @designs = @collection.design
  end

  def edit
    @collection = current_user.collection.find_by_id(params["id"])

    if @collection 
        render("edit")
    else
        redirect_to collections_path
    end
  end

  def update
    @collection = current_user.collection.find_by_id(params["id"])

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
    @collection = current_user.collections.find_by_id(params["id"])

    if @collection
        @collection.destroy
    end
    redirect_to collections_path
  end

  private
  def collection_params
      # params.require(:collection).permit(:title, :price, :description, :picture)
      params.require(:collection).permit(:title, :description)
  end
end