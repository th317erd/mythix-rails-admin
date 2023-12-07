# frozen_string_literal: true

# as sqlite3 memory doesnt preserve the schema between test runs,
# we cannot rely on rake db:test:prepare or rake db:migrate.
# We need to load the schema right now:

module SqliteMemorySchemaLoader
  class << self
    def run
      return if schema_loaded?

      solve_compat
      load_schema_once
      fix_active_admin_load
    end

    def fix_active_admin_load
      ActiveAdmin::Application.class_eval do
        def load(file)
          super
        rescue StandardError => e
          raise unless e.instance_of?(ActiveRecord::StatementInvalid) && e.message.match(/table/)

          SqliteMemorySchemaLoader.solve_compat
          SqliteMemorySchemaLoader.load_schema_once
        end
      end
    end

    def using_sqlite_memory?
      test_db_config = YAML.load_file(File.expand_path('../config/database.yml', __dir__), aliases: true)['test']
      test_db_config['adapter'].match(/sqlite/) && test_db_config['database'] == ':memory:'
    end

    def schema_loaded?
      User.count
      true
    rescue StandardError
      false
    end

    def solve_compat
      ActiveRecord::Migration.class_eval do
        def self.check_pending!
          true
        end
      end

      ActiveRecord::Schema.verbose = false
    end

    def load_schema_once
      return unless using_sqlite_memory?

      load_schema
    end

    def load_schema
      establish_connection_once

      schema_content = File.read(Rails.root.join('db/schema.rb'))

      eval schema_content # rubocop:disable Security/Eval
    end

    def establish_connection_once
      return if ActiveRecord::Base.connected?

      ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: ':memory:')
    end
  end
end
