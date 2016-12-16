require "rails_helper"

describe Wallpaper, type: :model do
  subject(:wallpaper) { described_class.new(attributes_for(:wallpaper)) }

  it { is_expected.to respond_to :user }
  it { is_expected.to respond_to :name }
  it { is_expected.to respond_to :image }

  it { is_expected.to be_valid }
end
