require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module LimpezaWeb
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    config.time_zone = 'Brasilia'
    config.active_record.default_timezone = :local

    config.i18n.default_locale = 'pt-BR'

    #config.middleware.insert_before Warden::Manager, Rack::Cors

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # config.middleware.insert_before 0, Rack::Cors do
    #   allow do
    #     origins '*'
    #     resource '*', headers: :any, methods: [:get, :post, :options]
    #   end
    # end

    config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins '*'
        resource '*',
        :headers => :any,
        :methods => [:get, :post, :options, :delete, :head, :patch],
        :expose  => ['access-token', 'expiry', 'token-type', 'uid', 'client']
      end
    end



  end
end
