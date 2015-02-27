class Autopark::Base < Grape::API
  mount Autopark::V1::Base
end
