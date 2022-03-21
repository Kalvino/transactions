module Responders
  extend ActiveSupport::Concern

  private

  def respond_with_error(error, status = :unprocessable_entity, context = {})
    is_exception = error.is_a?(StandardError)
    error_message = is_exception ? error.message : error
    render status:, json: { error: error_message }.merge(context)
  end

  def respond_with_success(message, status = :ok, context = {})
    render status:, json: { notice: message }.merge(context)
  end

  def respond_with_json(json = {}, status = :ok)
    render status:, json:
  end
end
