# frozen_string_literal: true

Gem::Specification.new do |spec|
  spec.name          = 'pg_failover'
  spec.version       = '1.1.1'
  spec.authors       = ['Aleksandar Ivanov', 'Andy Chambers', 'Sasha Gerrand']
  spec.email         = ['engineering+pg_failover@fundingcircle.com']
  spec.license       = 'BSD-3-Clause'

  spec.summary       = 'Handle Postgres failover events gracefully.'
  spec.description   = 'Handle Postgres failover events gracefully using your favourite ORM.'
  spec.homepage      = 'https://github.com/FundingCircle/pg_failover'

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  raise 'RubyGems 2.0 or newer is required to protect against public gem pushes.' unless spec.respond_to?(:metadata)

  spec.metadata = {
    'changelog_uri' => 'https://github.com/FundingCircle/pg_failover/blob/master/CHANGELOG.md',
    'homepage_uri' => spec.homepage,
    'source_code_uri' => 'https://github.com/FundingCircle/pg_failover'
  }

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.required_ruby_version = '>= 2.5'

  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'rake', '~> 12.3'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'rspec_junit_formatter', '~> 0.4'
  spec.add_development_dependency 'rubocop'
  spec.add_development_dependency 'rubocop-rspec'
end
