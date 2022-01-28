class ApplicationController < ActionController::Base
  include Pagy::Backend
  before_action :http_basic_authenticate

  def http_basic_authenticate
    authenticate_or_request_with_http_basic do |username, password|
      username == "proxycrawl" && password == "proxycrawl"
    end
  end
end
