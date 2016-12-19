class LikePolicy < ApplicationPolicy
  def allowed?
    record.user == user
  end
end
