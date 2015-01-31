class ReviewsController < ApplicationController

  load_and_authorize_resource param_method: :product_params
  before_filter :authenticate_user!

  def show
    redirect_to product_path(id: params[:product_id])
  end

  def create
    @review = Review.new(review_params)
    @review.product_id = params[:product_id]
    @review.user = current_user

    if @review.save
      flash[:success] = "Review was added successfully"
      redirect_to product_path(id: params[:product_id])
    else
      render 'products/show'
    end    
  end

  def update
    respond_to do |format|
      if @review.update_attributes(review_params)
        format.json { render json: {display_as: @review.msg} }
      else
        format.json { respond_with_bip(@review) }
      end
    end
  end

  def destroy
    @review.destroy
    flash[:alert] = "Review was deleted"

    redirect_to product_path(id: params[:product_id])
  end

  private

  def review_params
    params.require(:review).permit(:msg)
  end

end
