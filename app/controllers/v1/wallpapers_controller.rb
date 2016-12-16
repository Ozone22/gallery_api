module V1
  class WallpapersController < ApplicationController
    before_action :authenticate_user
    before_action :authorize_user, only: %i(update destroy)

    expose(:wallpaper)
    expose(:wallpapers) { Wallpaper.all }

    def create
      wallpaper.user = current_user
      if wallpaper.save
        head :created
      else
        respond_with :v1, wallpaper
      end
    end

    def index
      render json: wallpapers
    end

    def show
      render json: wallpaper
    end

    def update
      if wallpaper.update_attributes(wallpaper_params)
        head :no_content
      else
        respond_with :v1, wallpaper
      end
    end

    def destroy
      wallpaper.destroy!
      head :no_content
    end

    private

    def wallpaper_params
      params.require(:wallpaper).permit(:name, :image)
    end

    def authorize_user
      authorize(wallpaper, :allowed?)
    end
  end
end
