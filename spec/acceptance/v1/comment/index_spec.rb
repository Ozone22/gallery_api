require "rails_helper"
require "rspec_api_documentation/dsl"

resource "Comments" do
  include_context "current user signed in"

  subject(:response) { json_response_body }
  let(:wallpaper) { create :wallpaper, user: current_user }
  let!(:comment) { create :comment, wallpaper: wallpaper, user: current_user }

  get "/v1/wallpapers/:wallpaper_id/comments?page=:page&per_page=:per_page" do
    let(:page) { 1 }
    let(:per_page) { 1 }
    let(:wallpaper_id) { wallpaper.id }

    example_request "Get comments" do
      expect(response_status).to be 200
      expect(response["data"].first).to be_a_comment_representation(comment)
    end
  end
end
