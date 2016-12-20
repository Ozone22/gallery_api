module V1
  class CommentSerializer < ApplicationSerializer
    attributes :id, :text, :created_at, :wallpaper_id, :commenter_name

    def commenter_name
      object.user.full_name
    end
  end
end
