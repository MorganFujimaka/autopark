class CategoriesController < ApplicationController

  load_and_authorize_resource param_method: :product_params
  before_filter :authenticate_user!, except: :show

  def show
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      flash[:success] = "Category was created successfully"
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @category.update_attributes(category_params)
      flash[:success] = "Category was pdated successfully"
      redirect_to root_path
    else
      render 'edit'
    end
  end

  def destroy
    @category.destroy
    flash[:alert] = "Category was deleted"

    redirect_to root_path
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end

end
