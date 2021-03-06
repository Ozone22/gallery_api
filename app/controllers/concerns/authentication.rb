module Authentication
  extend ActiveSupport::Concern

  include RequestHelper

  included do
    include Pundit
    rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
    attr_reader :current_user
  end

  protected

  def authenticate_user
    if user_id_in_token?
      @current_user = User.find_by(id: auth_token[:user_id])
    else
      head :unauthorized
    end
  rescue JWT::VerificationError, JWT::DecodeError
    head :unauthorized
  end

  private

  def user_not_authorized
    head :forbidden
  end
end
