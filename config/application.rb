require_relative 'boot'

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "action_cable/engine"
require "sprockets/railtie"
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module LINEmodoki
  class Application < Rails::Application

    config.load_defaults 5.1

    config.generators.system_tests = nil
    #タイムゾーン変更
    config.time_zone = 'Tokyo'
    config.active_record.default_timezone = :local
    #アプリケーションの日本語化
    config.i18n.default_locale = :ja

    config.generators do |g|
      g.assets false           # assetsの無効化
      g.helper false           # helperの無効化
      g.test_framework false   # testの無効化
    end
  end
end

