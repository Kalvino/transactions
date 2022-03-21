class ApplicationController < ActionController::API
  before_action :authenticate_request

  include Responders
  include Rescuable

  private

  def authenticate_request
    header = request.headers['Authorization']

    raise Exceptions::AuthenticationError, 'missing token' if header.nil?

    header_token = header.split(' ').last
    auth_url = 'http://localhost:3001'

    conn = Faraday.new(
      url: auth_url,
      params: { token: header_token },
      headers: { 'Content-Type' => 'application/json' }
    )

    response = conn.get('/verify')
    @current_user = JSON.parse(response.body, symbolize_names: true)[:user]

    raise Exceptions::AuthenticationError, 'invalid token' unless @current_user
  end
end
