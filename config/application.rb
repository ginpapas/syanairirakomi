require File.expand_path('../boot', __FILE__)

require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "sprockets/railtie"

Bundler.require(*Rails.groups)

module Innertool
  class Application < Rails::Application
    config.time_zone = 'Tokyo'
    config.active_record.default_timezone = :local
    config.i18n.default_locale = :ja
    config.i18n.enforce_available_locales = true
    config.assets.precompile += %w(*.js *.css)
    config.autoload_paths += Dir["#{config.root}/lib/"]
    config.action_view.field_error_proc = Proc.new{ |html_tag, instance| html_tag.html_safe }
  end
end
