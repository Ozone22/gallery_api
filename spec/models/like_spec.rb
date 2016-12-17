require "rails_helper"

describe Like, type: :model do
  subject(:like) { Like.new(user: create(:user), wallpaper: create(:wallpaper)) }

  it { is_expected.to respond_to :user }
  it { is_expected.to respond_to :wallpaper }

  it { is_expected.to be_valid }
end
