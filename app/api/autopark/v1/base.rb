class Autopark::V1::Base < Grape::API
  mount Autopark::V1::Products

  add_swagger_documentation base_path: "/api",
                            api_version: 'v1',
                            hide_documentation_path: true
end
