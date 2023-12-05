require_relative "lib/mythix_rails_admin/version"

Gem::Specification.new do |spec|
  spec.name        = "mythix_rails_admin"
  spec.version     = MythixRailsAdmin::VERSION
  spec.authors     = ["Wyatt Greenway", "Miles Romney", "MAST Studios"]
  spec.email       = ["th317erd@gmail.com"]
  spec.homepage    = "https://github.com/th317erd/mythix_rails_admin"
  spec.summary     = "Administration for Rails"
  spec.description = "Rails administration framework using Mythix technologies"
  spec.license     = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the "allowed_push_host"
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/th317erd/mythix_rails_admin"
  spec.metadata["changelog_uri"] = "https://github.com/th317erd/mythix_rails_admin"

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    Dir["{app,config,db,lib}/**/*", "LICENSE", "Rakefile", "README.md"]
  end

  spec.add_dependency "rails", ">= 7.0.3.1"
end
