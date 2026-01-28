# config/application.rb
require_relative "boot"

require "rails/all"

Bundler.require(*Rails.groups)

module RecipeSearchApp
  class Application < Rails::Application
    config.load_defaults 7.1
    
    # アセットパイプラインの設定
    config.assets.enabled = true
    config.assets.compile = true
  end
end