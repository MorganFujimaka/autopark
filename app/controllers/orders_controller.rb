class OrdersController < ApplicationController
  authorize_resource
  before_filter :authenticate_user!

  expose(:order, attributes: :order_params)
  expose(:product)
  expose(:review)

  def create
    order.product_id = params[:product_id]
    order.user = current_user

    if order.save
      order.product.set_booked
      redirect_to order.product, success: 'Your car has been booked successfully'
    else
      render 'products/show'
    end
  end

  private

  def order_params
    params.require(:order).permit(:start_date, :end_date)
  end
end
