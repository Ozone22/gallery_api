class WallpaperPolicy < ApplicationPolicy
  def allowed?
    record.user == user
  end
end
