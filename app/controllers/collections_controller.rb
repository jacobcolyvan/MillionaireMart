class CollectionsController < ApplicationController
  before_action :authenticate_user!

  def index 
    @collections = Collections.all
  end

  def new
    @collection = Collection.new
  end

  def create
    # @listing = current_user.collection.create()
  end

  def show

  end

  def destroy
    
  end
end