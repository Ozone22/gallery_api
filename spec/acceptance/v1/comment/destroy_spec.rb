require "rails_helper"
require "rspec_api_documentation/dsl"

resource "Comments" do
  include_context "current user signed in"

  subject(:response) { json_response_body }
  let(:wallpaper) { create :wallpaper, user: current_user }
  let(:comment) { create :comment, wallpaper: wallpaper, user: current_user }

  delete "/v1/comments/:id" do
    let(:id) { comment.id }

    example_request "Delete comment" do
      expect(response_status).to be 204
    end
  end
end
