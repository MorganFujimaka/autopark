class CategoriesController < ApplicationController
  authorize_resource
  before_filter :authenticate_user!, except: :show

  expose(:category, attributes: :category_params)

  def create
    if category.save
      redirect_to root_path, success: 'Category was created successfully'
    else
      render 'new'
    end
  end

  def update
    if category.save
      redirect_to root_path, success: 'Category was updated successfully'
    else
      render 'edit'
    end
  end

  def destroy
    category.destroy
    redirect_to root_path, success: 'Category was deleted successfully'
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end
end
