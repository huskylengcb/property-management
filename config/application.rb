require_relative "boot"

require "rails/all"

require 'carrierwave'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module PropertyManagement
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
    config.eager_load_paths += %W(#{config.root}/lib)

    config.active_record.default_timezone = :local
    config.time_zone = 'Beijing'

    config.i18n.default_locale = :zh

    config.encoding = "utf-8"

    config.action_view.sanitized_allowed_tags = 'span', 'p', 'a', 'img', 'table', 'tr', 'td', 'li', 'ul',  'embed', 'em', 'strong', 'u'
    config.action_view.sanitized_allowed_attributes = 'id', 'href', 'src', 'height', 'width', 'class', 'style', 'align', 'target'
  end
end
