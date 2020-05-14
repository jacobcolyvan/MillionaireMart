class DesignsController < ApplicationController
  def new
    set_collections
    @design = Design.new
  end

  def create
    @design = current_user.design.create(design_params)
    if @design.errors.any?
      render "new"
    else 
      redirect_to collections_path
    end   
  end

  def edit
    set_collections
    @design = current_user.design.find_by_id(params["id"])

    if @design 
        render("edit")
    else
        redirect_to collections_path
    end
  end

  def update
    @design = current_user.design.find_by_id(params["id"])

    if @design 
        @design.update(design_params)
        if @design.errors.any?
            render "edit"
        else
            redirect_to collections_path
        end   
    else
        redirect_to collections_path
    end
  end

  def destroy
    @design = current_user.designs.find_by_id(params["id"])

    if @design
        @design.destroy
    end
    redirect_to collections_path
  end

  private
  def design_params
      params.require(:design).permit(:title, :description, :collection_id, :picture)
  end  

  def set_collections
    @collections = Collection.all
  end
end