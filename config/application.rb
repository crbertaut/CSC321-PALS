require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module VolunteerSite
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1
    
    # Load page-specific css
    #config.assets.precompile += %w( site.scss )

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    
    config.time_zone = 'Central Time (US & Canada)'
    config.active_record.default_timezone = :local
    
    config.generators do |g|
      g.test_framework :rspec, fixture: false
      g.fixture_replacement :factory_bot
    end
  end
end
