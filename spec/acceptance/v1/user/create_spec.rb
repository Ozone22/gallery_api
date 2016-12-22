require "rails_helper"
require "rspec_api_documentation/dsl"

resource "Users" do
  subject(:response) { json_response_body }

  post "/v1/users" do
    with_options scope: :user, required: true do
      parameter :email, "Email"
      parameter :password, "Password"
      parameter :password_confirmation, "Password Confirmation"
      parameter :full_name, "Name(can be full name)"
    end

    let(:user) { attributes_for :user }

    example "Registration with valid data" do
      do_request(user: user)
      expect(response).to be_a_session_representation
    end
  end
end
