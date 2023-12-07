# frozen_string_literal: true

# Configure Rails Environment
ENV['RAILS_ENV'] = 'test'

require_relative 'config/environment'
# ActiveRecord::Migrator.migrations_paths = [ File.expand_path('./db/migrate', __dir__) ]
require 'rails/test_help'
require 'database_cleaner-active_record'
require 'helpers/sqlite_memory_schema_loader'
require 'timecop'
require 'minitest'
require 'factory_bot_rails'

Timecop.safe_mode = true
DatabaseCleaner.strategy = :truncation

class Minitest::Spec
  include FactoryBot::Syntax::Methods

  after do
    DatabaseCleaner.clean
  end
end

# Load fixtures from the engine
if ActiveSupport::TestCase.respond_to?(:fixture_paths=)
  ActiveSupport::TestCase.fixture_paths = [
    File.expand_path('fixtures', __dir__),
    File.expand_path('fixtures/files', __dir__),
  ]
  ActionDispatch::IntegrationTest.fixture_paths = ActiveSupport::TestCase.fixture_paths + []
  ActiveSupport::TestCase.fixtures :all
end

if Minitest.respond_to?(:before_parallel_fork)
  Minitest.after_parallel_fork do |_i|
    # SqliteMemorySchemaLoader.solve_compat
    SqliteMemorySchemaLoader.load_schema_once
  end
else
  # SqliteMemorySchemaLoader.solve_compat
  SqliteMemorySchemaLoader.load_schema_once
end
