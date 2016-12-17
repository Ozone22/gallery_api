require "rails_helper"
require "rspec_api_documentation/dsl"

resource "Wallpapers" do
  include_context "current user signed in"

  subject(:response) { json_response_body }
  let(:wallpaper) { create :wallpaper, user: current_user }

  delete "/v1/wallpapers/:id" do
    let(:id) { wallpaper.id }

    example_request "Wallpaper delete" do
      expect(response_status).to be 204
    end
  end
end
