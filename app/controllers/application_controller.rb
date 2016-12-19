class ApplicationController < ActionController::API
  include Authentication

  respond_to :json
  serialization_scope :current_user

  protected

  def respond_with_token(token)
    render json: { authentication_token: token }, status: :created
  end
end
