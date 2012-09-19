require "active_support/ordered_options"

module JsRenderRails
  class Railtie < Rails::Engine
    config.jsRender = ActiveSupport::OrderedOptions.new
    config.jsRender.prefix = ""

    initializer "sprockets.jsRender", :after => "sprockets.environment", :group => :all do |app|
      next unless app.assets
      app.assets.register_engine(".tmpl", JsRender)
    end
  end
end
