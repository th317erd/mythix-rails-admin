# frozen_string_literal: true

## Uncomment and set this to only include directories you want to watch
directories(%w[lib config test].select { |d| Dir.exist?(d) ? d : UI.warning("Directory #{d} does not exist") })

guard :minitest do
  # with Minitest::Unit
  watch(%r{^test/(.*)/([^/]+)_test\.rb$})
  watch(%r{^app/(.*/)?([^/]+)\.rb$})     { |m| "test/app/#{m[1]}#{m[2]}_test.rb" }
  watch(%r{^lib/(.*/)?([^/]+)\.rb$})     { |m| "test/lib/#{m[1]}#{m[2]}_test.rb" }
  watch(%r{^test/test_helper\.rb$})      { 'test' }

  notification :terminal_notifier, sound: 'default'
end
