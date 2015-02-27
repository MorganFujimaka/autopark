class Autopark::V1::Products < Grape::API
  include Autopark::V1::Defaults

  resource :products do
    desc 'Returns list of all products'
    get ':all' do
      Product.all
    end

    desc 'Return single product'
    get ':id' do
      Product.find(params[:id])
    end
  end
end
