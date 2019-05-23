require_relative 'boot'

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "active_storage/engine"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_mailbox/engine"
require "action_text/engine"
require "action_view/railtie"
require "action_cable/engine"
require "sprockets/railtie"

Bundler.require(*Rails.groups)

module PatriotSwap
  class Application < Rails::Application
    config.load_defaults 6.0

    config.generators do |g|
      g.system_tests = nil
      g.test_framework :rspec
      # g.helper_specs false
      g.controller_specs false
      g.view_specs false
      g.routing_specs false
      g.request_specs false
    end
  end
end
