class ReviewsController < ApplicationController
  authorize_resource
  before_filter :authenticate_user!

  expose(:review, attributes: :review_params)
  expose(:reviews)

  def show
    redirect_to product_path(id: params[:product_id])
  end

  def create
    review.product_id = params[:product_id]
    review.user = current_user

    if review.save
      render 'products/show'
    else
      render json: review.errors, status: 422
    end
  end

  def update
    if review.save
      render json: { display_as: review.msg }
    else
      respond_with_bip(review)
    end
  end

  def destroy
    review.destroy
    render nothing: true
  end

  private

  def review_params
    params.require(:review).permit(:msg)
  end
end
