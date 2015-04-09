class ProductsController < ApplicationController
  authorize_resource
  before_filter :authenticate_user!, except: [:index, :show]

  expose(:product, attributes: :product_params)
  expose(:products) { Product.paginate(page: params[:page], per_page: 10) }
  expose(:review) { Review.new }
  expose(:order) { Order.new }

  def show
    return unless product
  end

  def create
    if product.save
      redirect_to product, success: 'Product was created successfully'
    else
      render 'new'
    end
  end

  def update
    if product.save
      redirect_to product, success: 'Product was updated successfully'
    else
      render 'edit'
    end
  end

  def destroy
    if product.destroy
      respond_to do |format|
        format.html { redirect_to root_path, success: 'Product was deleted successfully' }
        format.json { render json: {}, status: 200 }
      end
    else
      respond_to do |format|
        format.html { redirect_to product, alert: 'Unable to delete. Please try again.' }
        format.json { render json: {}, status: 422 }
      end
    end
  end

  private

  def product_params
    params.require(:product).permit(:title, :description, :price, :available, :category_id, :image)
  end
end
