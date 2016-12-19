module V1
  class WallpaperSerializer < ApplicationSerializer
    belongs_to :user

    attributes :id, :name, :image, :created_at, :liked_by_current_user?, :likes_count

    def liked_by_current_user?
      object.likers.include? current_user
    end
  end
end
