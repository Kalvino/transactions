class ApplicationController < ActionController::API
  before_action :authenticate_request

  include ApiResponders
  include ApiRescuable

  private

  def authenticate_request
    header = request.headers['Authorization']

    raise Exceptions::AuthenticationError, 'missing token' if header.nil?

    token = header.split(' ').last
    url = "http://localhost:3001/verify?token=#{token}"
    response = Faraday.get(url, headers: { 'Content-Type' => 'application/json' })

    @current_user = JSON.parse(response.body, symbolize_names: true)[:user]

    raise Exceptions::AuthenticationError, 'invalid token' unless @current_user
  end
end
