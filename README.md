# PgFailover
[![CircleCI](https://circleci.com/gh/FundingCircle/pg_failover/tree/master.svg?style=svg)](https://circleci.com/gh/FundingCircle/pg_failover/tree/master)
[![Gem Version](https://img.shields.io/gem/v/pg_failover.svg)](https://rubygems.org/gems/pg_failover)

Handle potential failover events in PostgreSQL database connections by
reconnecting if the database is in a recovery mode. This check occurs when a
connection is checked out of the connection pool.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'pg_failover'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install pg_failover

## Usage

This library can be configured via a code block or environment variables.

The configuration aspects are as follows:
- Enabled - Hooks a callback to the `pg` adapter.
- Max retries - How many times an attempt to reconnect should be made.
- Throttle interval - The period between checks on database connections.

In an initializer:

```ruby
PgFailover.configure do |config|
  config.enabled = true
  config.max_retries = 3
  config.throttle_interval = 3.3
end
```

You can also configure the logging device to be used:

```ruby
PgFailover.configure do |config|
  config.logger = Rails.logger
end
```

Using environment variables:

    POSTGRES_FAILOVER_ENABLED=true
    POSTGRES_FAILOVER_MAX_RETRIES=3
    POSTGRES_FAILOVER_THROTTLE_INTERVAL=3.3

The above settings demonstrate enabling the failover checks and will only attempt to
re-establish a database connection 3 times with a pause of 3.3 seconds between
each attempt.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run
`rake test` to run the tests. You can also run `bin/console` for an interactive
prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To
release a new version, update the version number in `pg_failover.gemspec`, and
then run `bundle exec rake release`, which will create a git tag for the
version, push git commits and tags, and push the `.gem` file to
[rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/FundingCircle/pg_failover.

## License

Copyright © 2019 Funding Circle.

Distributed under the BSD 3-Clause License.
