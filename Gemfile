# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

# Specify your gem's dependencies in mythix_rails_admin.gemspec.
gemspec

gem 'sqlite3'

gem 'sprockets-rails'

# Start debugger with binding.b [https://github.com/ruby/debug]
# gem "debug", ">= 1.0.0"

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'database_cleaner-active_record'
  gem 'factory_bot_rails'
  gem 'guard'
  gem 'guard-minitest'
  gem 'minitest'
  gem 'minitest-focus'
  gem 'minitest-stub_any_instance'
  gem 'rubocop'
  gem 'scenic_sqlite_adapter'
  gem 'terminal-notifier-guard'
  gem 'timecop'
end
