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

    respond_to do |format|
      if @review.save
        format.html { redirect_to product_path(id: params[:product_id]),
                      notice: "Review was added successfully" }
        format.js   { render 'products/show'}
      else
        format.html { @product = Product.find(params[:product_id])
                      render 'products/show' }
        format.js   { render json: @review.errors, status: :unprocessable_entity }
      end
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

    render nothing: true
  end

  private

  def review_params
    params.require(:review).permit(:msg)
  end

end
