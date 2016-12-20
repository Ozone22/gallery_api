require "rails_helper"

describe Wallpaper, type: :model do
  subject(:wallpaper) do
    attributes = attributes_for :wallpaper
    attributes[:user] = create(:user)
    described_class.new(attributes)
  end

  after { wallpaper.remove_image! }

  it { is_expected.to respond_to :user }
  it { is_expected.to respond_to :name }
  it { is_expected.to respond_to :image }
  it { is_expected.to respond_to :likes }
  it { is_expected.to respond_to :likes_count }
  it { is_expected.to respond_to :comments }

  it { is_expected.to be_valid }
end
