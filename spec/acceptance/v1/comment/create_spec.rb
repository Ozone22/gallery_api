require "rails_helper"
require "rspec_api_documentation/dsl"

resource "Comments" do
  include_context "current user signed in"

  subject(:response) { json_response_body }
  let(:wallpaper) { create :wallpaper, user: current_user }
  # Capybara DSL fix
  let(:text) { nil }

  post "/v1/wallpapers/:wallpaper_id/comments" do
    with_options scope: :comment, required: true do
      parameter :text, "Comment text"
    end

    let(:wallpaper_id) { wallpaper.id }
    let(:comment) { attributes_for :comment }

    example "Create comment" do
      do_request(comment: comment)
      expect(response_status).to be 201
    end
  end
end
