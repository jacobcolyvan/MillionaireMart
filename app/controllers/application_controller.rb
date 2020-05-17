class ApplicationController < ActionController::Base
  # before_action :authenticate_user!, :current_user, :current_shopping_cart

  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  # Retrieves user login from session memory 
  # def current_user
  #   if session[:user_id]
  #     @user = User.find(session[:user_id])
  #   end
  # end

  # def current_shopping_cart
  #   if login?
  #     @shopping_cart = ShoppingCart.find(session[:shopping_cart])
  #   else
  #     @shopping_cart = ShoppingCart.create
  #     session[:shopping_cart] = @shopping_cart.id
  #   end

  # end

  # def login?
  #   !!current_user
  # end

  protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password, :address)}

      devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :email, :password, :current_password, :address)}
    end
end
