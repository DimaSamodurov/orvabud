require 'refinerycms-base'

module Refinery
  module Gallery
    class Engine < Rails::Engine
      initializer "static assets" do |app|
        app.middleware.insert_after ::ActionDispatch::Static, ::ActionDispatch::Static, "#{root}/public"
      end

      config.after_initialize do
        Refinery::Plugin.register do |plugin|
          plugin.name = "refinerycms_gallery"
          plugin.url = {:controller => '/admin/gallery/entries', :action => 'index'}
          plugin.menu_match = /^\/?(admin|refinery)\/gallery\/?(entries|sections)?/
          plugin.activity = {
            :class => GalleryEntry
          }
        end
      end
    end
  end
end