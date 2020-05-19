class ListingsController < ApplicationController
  before_action :set_user_listing, only: [:edit, :update, :destroy]
  before_action :set_listing, only: [:show]

  def index
    @listings = Listing.all.sort_by(&:created_at).reverse
  end

  def show 
    @listing = Listing.find(params["id"])

    session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      customer_email: current_user.email,
      line_items: [{
          name: @listing.title,
          description: @listing.description,
          amount: 30 * 100,
          currency: 'aud',
          quantity: 1,
      }],
      payment_intent_data: {
          metadata: {
              user_id: current_user.id,
              listing_id: @listing.id
          }
      },
      success_url: "#{root_url}payments/success?userId=#{current_user.id}&listingId=#{@listing.id}",
      cancel_url: "#{root_url}listings"
  )

  @session_id = session.id
  end

  def new
    set_collections
    @listing = Listing.new
  end

  def create
    @listing = current_user.listings.create(listing_params)
    if @listing.errors.any?
      render "new"
    else 
      redirect_to collections_path
    end   
  end

  def edit
    set_collections
    @listing = current_user.listings.find_by_id(params["id"])

    if @listing 
        render("edit")
    else
        redirect_to collections_path
    end
  end

  def update
    @listing = current_user.listings.find_by_id(params["id"])

    if @listing 
        @listing.update(listing_params)
        if @listing.errors.any?
            render "edit"
        else
            redirect_to collections_path
        end   
    else
        redirect_to collections_path
    end
  end

  def destroy
    @listing = current_user.listings.find_by_id(params["id"])

    if @listing
        @listing.destroy
    end
    redirect_to collections_path
  end

  private
  def listing_params
      params.require(:listing).permit(:title, :description, :collection_id, :picture)
  end  

  def set_collections
    @collections = Collection.all
  end

  def set_listing    
    @listing= Listing.find(params[:id])
  end

  def set_user_listing    
    id = params[:id]
    @listing = current_user.listings.find_by_id(id) if current_user
  
    if @listing == nil
        redirect_to collections_path
    end
  end
end