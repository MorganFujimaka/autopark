class ProductsController < ApplicationController

  load_and_authorize_resource param_method: :product_params
  before_filter :authenticate_user!, except: [:index, :show]

  def index
    @products = Product.paginate(page: params[:page], per_page: 5)
    respond_to do |format|
      format.html
      format.json { render json: @products }
      format.xml { render xml: @products }
      format.any { redirect_to root_path, alert: "Not supported file format" }
    end
  end

  def show
    @review = Review.new
    @order = Order.new
    @booked_dates = @product.booked_dates
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      flash[:success] = "Product was created successfully"
      redirect_to @product
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @product.update_attributes(product_params)
      flash[:success] = "Product was updated successfully"
      redirect_to @product
    else
      render 'edit'
    end
  end

  def destroy
    if @product.destroy
      render json: { notice: 'Product was deleted successfully'}, status: 200
    else
      render json: { alert: 'Unable to delete. Please try again.' }, status: 422
    end
  end

  private

  def product_params
    params.require(:product).permit(:title, :description, :price, :available, :category_id, :image)
  end
end
