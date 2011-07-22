require 'refinerycms-base'

module Refinery
  module Galleries
    class Engine < Rails::Engine
      initializer "static assets" do |app|
        app.middleware.insert_after ::ActionDispatch::Static, ::ActionDispatch::Static, "#{root}/public"
      end

      config.after_initialize do
        Refinery::Plugin.register do |plugin|
          plugin.name = "galleries"
          plugin.activity = {
            :class => Gallery,
            :title => 'description'
          }
        end
      end
    end
  end
end
require File.expand_path('../refinerycms-sections', __FILE__)
