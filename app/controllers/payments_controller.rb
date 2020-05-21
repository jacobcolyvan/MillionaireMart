class PaymentsController < ApplicationController
  # Call webhook
  skip_before_action :verify_authenticity_token, only: [:webhook]

  def success
    # Creates new order if Stripe returns successful
    Order.create(user: current_user, listing_id: params[:listingId])
  end

  def webhook
    # Logic for Payment Webhook
    payment_id= params[:data][:object][:payment_intent]
    payment = Stripe::PaymentIntent.retrieve(payment_id)
    listing_id = payment.metadata.listing_id
    user_id = payment.metadata.user_id

    p "listing id " + listing_id
    p "user id " + user_id

    status 200
  end
end