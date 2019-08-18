require 'simplecov'
SimpleCov.start

ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)

abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'spec_helper'
require 'rspec/rails'
require 'capybara/rails'
require "money-rails/test_helpers"
require "pundit/rspec"

require 'sidekiq/testing' 
Sidekiq::Testing.inline!

require 'webmock/rspec'
WebMock.disable_net_connect!(allow_localhost: true)

include Warden::Test::Helpers
Warden.test_mode!

ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.use_transactional_fixtures = false
  config.before(:suite) { DatabaseCleaner.clean_with(:truncation) }
  config.before(:each) { DatabaseCleaner.strategy = :transaction }
  config.before(:each, :js => true) { DatabaseCleaner.strategy = :truncation }
  config.before(:each) { DatabaseCleaner.start }

  config.before(:each) do 
    stub_request(:get, %r{books.googleapis.com|googleapis.com/books|books.google.com}).
      to_return( status: 200, body: file_fixture("google_book.json").read)

    stub_request(:get, %r{maps.googleapis.com}).
      to_return( status: 200, body: "")
  end

  config.before(:each) do 
    Geocoder.configure(lookup: :test)
    Geocoder::Lookup::Test.set_default_stub(
      [
        {
          "coordinates" => [38.8315, 77.3115],
          "address" => "Fairfax, VA, USA",
          "state" => "Virginia",
          "state_code" => "VA",
          "country" => "United States",
          "country_code" => "US"
        }
      ]
    )
  end

  config.after(:each) { DatabaseCleaner.clean }
  config.filter_rails_from_backtrace!
  config.infer_spec_type_from_file_location!
end

Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec
    with.library :rails
  end
end