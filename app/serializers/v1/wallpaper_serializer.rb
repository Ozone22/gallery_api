module V1
  class WallpaperSerializer < ApplicationSerializer
    belongs_to :user

    attributes :id, :name, :image, :created_at
  end
end
