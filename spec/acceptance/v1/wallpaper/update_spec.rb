require "rails_helper"
require "rspec_api_documentation/dsl"

resource "Wallpapers" do
  include_context "current user signed in"

  subject(:response) { json_response_body }
  let(:wallpaper) { create :wallpaper, user: current_user }

  put "/v1/wallpapers/:id" do
    with_options scope: :wallpaper do
      parameter :name, "Wallpaper name"
      parameter :image, "Image file(jpeg jpg png gif)"
    end

    let(:id) { wallpaper.id }
    let(:name) { "newName" }

    example_request "Wallpaper update with valid data" do
      expect(response_status).to be 204
      expect(wallpaper.reload.name).to eq name
    end
  end
end
