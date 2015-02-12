class Api::V1::ProductsController < ApplicationController
  before_action :authenticate
  respond_to :json

  def index
    @products = Product.all
  end

  def show
    respond_with Product.find(params[:id])
  end

  def create
  end

  def update
  end

  def destroy
  end

  protected
  
  def authenticate
    authenticate_or_request_with_http_token do |token, options|
      User.find_by(auth_token: token)
    end
  end
end
