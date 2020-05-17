class CollectionsController < ApplicationController
  # before_action :authenticate_user!
  before_action :set_user_collection, only: [:edit, :update, :destroy]
  before_action :set_collection, only: [:show]

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
    @designs = @collection.designs
  end

  def edit
    @collection = current_user.collections.find_by_id(params["id"])

    if @collection 
        render("edit")
    else
        redirect_to collections_path
    end
  end

  def update
    @collection = current_user.collections.find_by_id(params["id"])

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
    Collection.find(params[:id]).destroy
    redirect_to collections_path
  end

  private
  def collection_params
    # TODO: add require picture
      params.require(:collection).permit(:title, :description, :picture)
  end

  def set_collection
    @collection = Collection.find(params[:id])
  end

  def set_user_collection
    id = params[:id]
    @collection = current_user.collections.find_by_id(id) if current_user
  
    if @collection == nil
        redirect_to collections_path
    end
  end
end

