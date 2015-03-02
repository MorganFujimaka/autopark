module Autopark::V1::Defaults
  extend ActiveSupport::Concern

  included do
    # common Grape settings
    version 'v1'
    format :json

    # global handler for simple not found case
    rescue_from ActiveRecord::RecordNotFound do |e|
      error_response(message: e.message, status: 404)
    end

    # global exception handler, used for error notifications
    rescue_from :all do |e|
      if Rails.env.development?
        raise e
      else
        Raven.capture_exception(e)
        error_response(message: "Internal server error", status: 500)
      end
    end

    before do
      error!('Unauthorized', 401) unless authenticated
    end

    helpers do
      def authenticated
        user = User.find_by_email(params[:email])
        user && user.is_admin && user.valid_password?(params[:password])
      end
    end
  end
end
