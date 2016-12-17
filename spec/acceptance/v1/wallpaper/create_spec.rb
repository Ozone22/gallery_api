require "rails_helper"
require "rspec_api_documentation/dsl"

resource "Wallpapers" do
  include_context "current user signed in"

  subject(:response) { json_response_body }

  post "/v1/wallpapers" do
    with_options scope: :wallpaper, required: true do
      parameter :name, "Wallpaper name"
      parameter :image, "Image file(jpeg jpg png gif)"
    end

    let(:wallpaper) { attributes_for :wallpaper, user: current_user }

    example "Wallpaper upload with valid data" do
      do_request(wallpaper: wallpaper)
      expect(response_status).to be 201
    end
  end
end
