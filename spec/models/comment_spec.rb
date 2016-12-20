require "rails_helper"

describe Comment, type: :model do
  subject(:comment) do
    attributes = attributes_for :comment
    attributes[:user] = create(:user)
    attributes[:wallpaper] = create(:wallpaper)
    described_class.new(attributes)
  end

  it { is_expected.to respond_to(:text) }
  it { is_expected.to respond_to(:user) }
  it { is_expected.to respond_to(:wallpaper) }

  it { is_expected.to be_valid }
end
