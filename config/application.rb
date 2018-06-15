require_relative 'boot'

require 'rails'

require 'active_model/railtie'
require 'active_job/railtie'
require 'action_controller/railtie'
require 'action_mailer/railtie'
require 'action_view/railtie'
require 'action_cable/engine'
require 'sprockets/railtie'
require 'rails/test_unit/railtie'
require 'will_paginate/mongoid'

Bundler.require(*Rails.groups)

module Academy
  class Application < Rails::Application
    config.load_defaults 5.1

    config.i18n.default_locale = :en
  end
end
