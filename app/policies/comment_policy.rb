class CommentPolicy < ApplicationPolicy
  def allowed?
    record.user == user
  end
end
