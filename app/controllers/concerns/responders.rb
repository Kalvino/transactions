module Responders
  extend ActiveSupport::Concern

  private

  def error_response(message, status = :unprocessable_entity, context = {})
    render status, json: { error: message }.merge(context)
  end
end
