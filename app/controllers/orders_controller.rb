class OrdersController < ApplicationController
  load_and_authorize_resource param_method: :product_params
  before_filter :authenticate_user!

  def create
    @order = Order.new(order_params)
    @order.product_id = params[:product_id]
    @order.user = current_user

    if @order.save
      @order.product.set_booked
      redirect_to @order.product, notice: "Your car has been booked successfully!"
    else
      render "products/show"
    end
  end

  private

  def order_params
    params.require(:order).permit(:start_date, :end_date)
  end
end
