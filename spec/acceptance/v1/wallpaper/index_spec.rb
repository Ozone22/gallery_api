require "rails_helper"
require "rspec_api_documentation/dsl"

resource "Wallpapers" do
  include_context "current user signed in"

  subject(:response) { json_response_body }
  let!(:wallpaper) { create :wallpaper, user: current_user }

  get "/v1/wallpapers?page=:page&per_page=:per_page" do
    let(:page) { 1 }
    let(:per_page) { 1 }

    example_request "Get wallpapers" do
      expect(response_status).to be 200
      expect(response["data"].first).to be_a_wallpaper_representation(wallpaper)
    end
  end
end
