class OrdersController < ApplicationController
  def index 
    # if user_signed_in?
    #   @ordersBought = orders.find
    #   @ordersSold = orders.find
    # else  

    # end
  end

  def create
    @order = current_user.order.create(design_params)
    if @design.errors.any?
      render "new"
    else 
      redirect_to collections_path
    end 
  end

  private
  def orders_params
      params.require(:order).permit(:address, :comment, :shirt_size, :user_id, :design_id)
  end  
end