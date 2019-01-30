Gem::Specification.new do |spec|
  spec.name          = "pg_failover"
  spec.version       = "1.0.0"
  spec.authors       = ["Aleksandar Ivanov", "Andy Chambers", "Sasha Gerrand"]
  spec.email         = ["engineering+pg_failover@fundingcircle.com"]

  spec.summary       = %q{Handle Postgres failover events gracefully.}
  spec.description   = %q{Handle Postgres failover events gracefully using your favourite ORM.}
  spec.homepage      = "https://github.com/FundingCircle/pg_failover"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

    spec.metadata["homepage_uri"] = spec.homepage
    spec.metadata["source_code_uri"] = "https://github.com/FundingCircle/pg_failover"
    spec.metadata["changelog_uri"] = "https://github.com/FundingCircle/pg_failover/blob/master/CHANGELOG.md"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.17"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end