ENV["RAILS_ENV"] ||= "test"
require File.expand_path("../../config/environment", __FILE__)
Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }
abort("The Rails environment is running in production mode!") if Rails.env.production?
require "spec_helper"
require "rspec/rails"
require "carrierwave/test/matchers"
ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  config.use_transactional_fixtures = true
  config.infer_spec_type_from_file_location!
  config.filter_rails_from_backtrace!

  config.include JsonSpec::Helpers
  config.include Helpers
  config.include Capybara::DSL
  config.include CarrierWave::Test::Matchers
end
