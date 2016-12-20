module V1
  class LikesController < ApplicationController
    before_action :authenticate_user

    expose(:wallpaper)

    def create
      like = current_user.likes.build(wallpaper: wallpaper)
      if like.save
        head :created
      else
        respond_with :v1, like
      end
    end

    def destroy
      if like = Like.find_by(user: current_user, wallpaper: wallpaper)
        like.destroy
      end
      head :no_content
    end
  end
end
