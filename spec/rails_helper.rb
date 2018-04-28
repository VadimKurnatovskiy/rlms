ENV["RAILS_ENV"] ||= "test"

require File.expand_path("../../config/environment", __FILE__)

# Prevent database truncation if the environment is production
abort("The Rails environment is running in production mode!") if Rails.env.production?

require "spec_helper"
require "rspec/rails"
require "shoulda/matchers"
require "simplecov"

Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  config.infer_spec_type_from_file_location!
  config.filter_rails_from_backtrace!
end

Capybara.javascript_driver = :webkit

Capybara::Webkit.configure do |config|
  config.allow_url("fonts.gstatic.com")
end

Capybara::Webkit.configure do |config|
  config.allow_url("http://localhost:5000/teachers/topics/slug1")
end


SimpleCov.start "rails" do
  add_filter "/.bundle"

  add_group "Decorators", "app/decorators"
end
