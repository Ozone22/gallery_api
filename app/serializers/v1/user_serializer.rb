module V1
  class UserSerializer < ApplicationSerializer
    has_many :wallpapers

    attributes :id, :email, :full_name
  end
end
