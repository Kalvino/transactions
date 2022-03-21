module Rescuable
  extend ActiveSupport::Concern

  included do
    rescue_from ActiveRecord::RecordNotFound, with: :handle_record_not_found
    rescue_from ActiveRecord::RecordInvalid, with: :handle_validation_error
    rescue_from ActiveRecord::RecordNotUnique, with: :handle_record_not_unique
    rescue_from ActionController::ParameterMissing, with: :handle_api_error
    rescue_from Exceptions::AuthenticationError, with: :handle_authentication_error
    rescue_from Exceptions::AuthorizationError, with: :handle_authorization_error
  end

  private

  def handle_validation_error(exception)
    error_response(exception)
  end

  def handle_record_not_found(exception)
    error_response(exception.message, :not_found)
  end

  def handle_record_not_unique(exception)
    error_response(exception)
  end

  def handle_api_error(exception)
    error_response(exception, :internal_server_error)
  end

  def handle_authentication_error(message = 'authentication failure')
    error_response(message, :unauthorized)
  end

  def handle_authorization_error(message = 'authorization denied')
    error_response(message, :forbidden)
  end
end
