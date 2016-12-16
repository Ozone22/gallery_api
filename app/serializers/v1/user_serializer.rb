module V1
  class UserSerializer < ApplicationSerializer
    attributes :id, :email, :full_name
  end
end
