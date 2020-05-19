class OrdersController < ApplicationController
  def index 
    if user_signed_in?
      @orders = current_user.orders
    else  
      redirect_to collections_path
    end
  end
end