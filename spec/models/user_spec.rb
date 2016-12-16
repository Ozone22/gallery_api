require "rails_helper"

describe User, type: :model do
  subject(:user) { described_class.new(attributes_for(:user)) }

  it { is_expected.to respond_to :email }
  it { is_expected.to respond_to :password }
  it { is_expected.to respond_to :full_name }
  it { is_expected.to respond_to :wallpapers }

  it { is_expected.to be_valid }
end
