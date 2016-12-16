module V1
  class UsersController < ApplicationController
    before_action :authenticate_user, except: %i(create)
    before_action :authorize_user, except: %i(create show)

    expose(:user)

    def create
      if user.save
        token = JWTWrapper.encode(user_id: user.id)
        respond_with_token(token)
      else
        respond_with :v1, user
      end
    end

    def show
      render json: user
    end

    def update
      if user.update_attributes(user_params)
        head :no_content
      else
        respond_with :v1, user
      end
    end

    def destroy
      user.destroy!
      head :no_content
    end

    private

    def user_params
      params.require(:user).permit(:email, :password, :full_name)
    end

    def authorize_user
      authorize(user, :allowed?)
    end
  end
end
