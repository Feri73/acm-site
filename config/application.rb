require File.expand_path('../boot', __FILE__)

# Pick the frameworks you want:
require "active_model/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "sprockets/railtie"
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Acm
  class Application < Rails::Application
    config.time_zone = 'Tehran'
    config.i18n.default_locale = :fa
    if cookies.has_key?(:local) && cookies[:local]
    	config.i18n.default_locale = :en
    	@eng=true
    end
    config.assets.precompile += Ckeditor.assets
    config.assets.precompile += %w( ckeditor/* )	
    config.assets.paths << Rails.root.join("app", "assets", "fonts")
    #config.action_controller.relative_url_root = "/acm"
    #config.autoload_paths += %W(#{config.root}/app/models/ckeditor)
  end
end
