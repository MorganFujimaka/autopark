class Autopark::V1::Products < Grape::API
  include Autopark::V1::Defaults

  resource :products do
    desc 'Returns list of all products'
    get do
      Product.all
    end

    desc 'Return single product'
    get ':id' do
      Product.find(params[:id])
    end

    desc 'Create new product'
    params do
      requires :title, type: String
      requires :description, type: String
      requires :price, type: Float
    end
    post 'new' do
      Product.create({
        title:params[:title],
        description:params[:description],
        price:params[:price]
      })
    end

    desc 'Delete product'
    delete ':id' do
      Product.find(params[:id]).destroy
    end
  end
end
