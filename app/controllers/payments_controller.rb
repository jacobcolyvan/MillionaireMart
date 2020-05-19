class PaymentsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:webhook]

  def success
    puts "******"
    puts params
    puts params["designId"]
    puts "******"
    Order.create(user: current_user, design_id: params[:designId])
  end

  def webhook
    payment_id= params[:data][:object][:payment_intent]
    payment = Stripe::PaymentIntent.retrieve(payment_id)
    design_id = payment.metadata.design_id
    user_id = payment.metadata.user_id

    p "design id " + design_id
    p "user id " + user_id

    status 200
  end
end