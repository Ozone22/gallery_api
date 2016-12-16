class UserPolicy < ApplicationPolicy
  def allowed?
    user == record
  end
end
