require "rails_helper"
require "rspec_api_documentation/dsl"

resource "Likes" do
  include_context "current user signed in"

  subject(:response) { json_response_body }
  let(:wallpaper) { create :wallpaper, user: current_user }
  let!(:like) { create :like, user: current_user, wallpaper: wallpaper }

  delete "/v1/wallpapers/:wallpaper_id/like" do
    let(:wallpaper_id) { wallpaper.id }

    example_request "Destroy like" do
      expect(response_status).to be 204
    end
  end
end
