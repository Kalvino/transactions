module Responders
  extend ActiveSupport::Concern

  private

  def error_response(message, response_status = :unprocessable_entity, context = {})
    render status: response_status, json: { error: message }.merge(context)
  end
end
