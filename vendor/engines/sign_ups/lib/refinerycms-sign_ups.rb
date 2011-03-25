require 'refinery'

module Refinery
  module SignUps
    class Engine < Rails::Engine
      initializer "static assets" do |app|
        app.middleware.insert_after ::ActionDispatch::Static, ::ActionDispatch::Static, "#{root}/public"
      end

      config.after_initialize do
        Refinery::Plugin.register do |plugin|
          plugin.name = "sign_ups"
          plugin.activity = {
            :class => SignUp,
            :title => 'name'
          }
        end
      end
    end
  end
end
