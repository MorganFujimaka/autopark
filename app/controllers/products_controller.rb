class ProductsController < ApplicationController

  load_and_authorize_resource param_method: :product_params
  before_filter :authenticate_user!, except: [:index, :show]

  def index
    @products = Product.all
  end

  def show
    @review = Review.new
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
    @product.destroy
    flash[:alert] = "Product was deleted"

    redirect_to '#index'
  end

  private

  def product_params
    params.require(:product).permit(:title, :description, :category_id)
  end
end
