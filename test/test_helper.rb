# frozen_string_literal: true

# Configure Rails Environment
ENV['RAILS_ENV'] = 'test'

require_relative 'app/dummy/config/environment'
ActiveRecord::Migrator.migrations_paths = [File.expand_path('./dummy/db/migrate', __dir__)]
ActiveRecord::Migrator.migrations_paths << File.expand_path('../db/migrate', __dir__)
require 'rails/test_help'
require 'timecop'

# Load fixtures from the engine
if ActiveSupport::TestCase.respond_to?(:fixture_paths=)
  ActiveSupport::TestCase.fixture_paths = [
    File.expand_path('fixtures', __dir__),
    File.expand_path('fixtures/files', __dir__),
  ]
  ActionDispatch::IntegrationTest.fixture_paths = ActiveSupport::TestCase.fixture_paths + []
  ActiveSupport::TestCase.fixtures :all
end

class MythixRailsAdminTestCase < ActiveSupport::TestCase
end
