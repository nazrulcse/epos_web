module Api
  module V1
    module Concerns
      module ExceptionHandler
        # provides the more graceful `included` method
        extend ActiveSupport::Concern

        included do
          rescue_from ActiveRecord::RecordNotFound do |e|
            json_response({ error: {message: e.message, status: 404} }, :not_found)
          end

          rescue_from ActiveRecord::RecordInvalid do |e|
            json_response({ error: {message: e.message, status: 422 } }, :unprocessable_entity)
          end
        end
      end
    end
  end
end