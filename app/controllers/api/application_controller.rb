class Api::ApplicationController < ActionController::Base
  include Pagy::Backend
  before_action :authenticate
  skip_before_action :verify_authenticity_token
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  private
  def authenticate
    api_key = request.headers[:TOKEN]
    if api_key.blank? || !ActiveSupport::SecurityUtils.secure_compare(api_key, ENV["API_KEY"])
      render json: { error: 'Unauthorized!!' }, status: :unauthorized
    end
  end

  def record_not_found
    render json: { error: 'Record not found!!' }, status: 404
  end
end
