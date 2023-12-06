# frozen_string_literal: true

module MythixRailsAdmin
  class Engine < ::Rails::Engine
    isolate_namespace MythixRailsAdmin

    initializer 'mythix_rails_admin.assets.precompile' do |app|
      app.config.assets.precompile << 'mythix_rails_admin_manifest.js'
    end
  end
end
