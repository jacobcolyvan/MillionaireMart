class ListingsController < ApplicationController
  before_action :set_user_listing, only: [:edit, :update, :destroy]
  before_action :set_listing, only: [:show]

  def index
    # Sorts listings and makes them available to index view
    @listings = Listing.all.sort_by(&:created_at)
  end

  def show 
    @listing = Listing.find(params["id"])
    # Sets up stripe logic if user is logged in
    if current_user
      session = Stripe::Checkout::Session.create(
        payment_method_types: ['card'],
        customer_email: current_user.email,
        line_items: [{
            name: @listing.title,
            description: @listing.description,
            amount: @listing.price * 100,
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
  end

  def new
    set_collections
    @listing = Listing.new
  end

  def create
    @listing = current_user.listings.create(listing_params)
    # Ensures there are no errors when creating new collection
    if @listing.errors.any?
      render "new"
    else 
      redirect_to collections_path
    end   
  end

  def edit
    # Makes collections available for select input in the edit view
    set_collections
    @listing = current_user.listings.find_by_id(params["id"])
    # Ensures there are no errors when creating new collection
    if @listing 
        render("edit")
    else
        redirect_to collections_path
    end
  end

  def update
    @listing = current_user.listings.find_by_id(params["id"])
    # Updates listing if collection matches db, and there are no errors
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
    @orders = current_user.listings.orders.find_by_id(params["id"])
    if @listing
        @listing.destroy
    end
    redirect_to collections_path
  end

  private
  def listing_params
    # Sanitises listing params
    params.require(:listing).permit(:title, :description, :collection_id, :picture, :price)
  end  

  def set_collections
    @collections = Collection.all
  end

  def set_listing    
    @listing= Listing.find(params[:id])
  end

  def set_user_listing   
    # Sets listings that belong to users if logged in
    id = params[:id]
    @listing = current_user.listings.find_by_id(id) if current_user
  
    if @listing == nil
        redirect_to collections_path
    end
  end
end