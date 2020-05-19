class OrdersController < ApplicationController
  def index 
    # if user_signed_in?
    #   @ordersBought = orders.find
    #   @ordersSold = orders.find
    # else  

    # end
  end

  # def create
  #   # @order = current_user.order.create(design_params)
  #   Order.create(user_id: params[:userID], design_id: params[:designID])
  # end

  private
  def orders_params
      # params.require(:order).permit(:comment, :shirt_size, :user_id, :design_id)
  end  
end