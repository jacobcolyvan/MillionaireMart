class DesignsController < ApplicationController
  before_action :set_user_design, only: [:edit, :update, :destroy]
  before_action :set_design, only: [:show]

  def index
    @designs = Design.all.sort_by(&:created_at).reverse
  end

  def show 
    @design = Design.find(params["id"])

    session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      customer_email: current_user.email,
      line_items: [{
          name: @design.title,
          description: @design.description,
          amount: 30 * 100,
          currency: 'aud',
          quantity: 1,
      }],
      payment_intent_data: {
          metadata: {
              user_id: current_user.id,
              design_id: @design.id
          }
      },
      success_url: "#{root_url}payments/success?userId=#{current_user.id}&designId=#{@design.id}",
      cancel_url: "#{root_url}designs"
  )

  @session_id = session.id
  end

  def new
    set_collections
    @design = Design.new
  end

  def create
    @design = current_user.designs.create(design_params)
    if @design.errors.any?
      render "new"
    else 
      redirect_to collections_path
    end   
  end

  def edit
    set_collections
    @design = current_user.designs.find_by_id(params["id"])

    if @design 
        render("edit")
    else
        redirect_to collections_path
    end
  end

  def update
    @design = current_user.designs.find_by_id(params["id"])

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

  def set_design    
    @design= Design.find(params[:id])
  end

  def set_user_design    
    id = params[:id]
    @design = current_user.designs.find_by_id(id) if current_user
  
    if @design == nil
        redirect_to collections_path
    end
  end
end