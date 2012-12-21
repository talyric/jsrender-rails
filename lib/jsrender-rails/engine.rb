require "active_support/ordered_options"

module JsRenderRails
  class Railtie < Rails::Engine
    config.jsrender = ActiveSupport::OrderedOptions.new
    config.jsrender.prefix = ""

    initializer "sprockets.jsrender", :after => "sprockets.environment", :group => :all do |app|
      next unless app.assets
      app.assets.register_engine(".tmpl", JsRender)
    end
  end
end
