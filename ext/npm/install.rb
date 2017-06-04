# frozen_string_literal: true

require_relative '../../lib/npm_commands'

# Support older node, see https://github.com/Medium/phantomjs/pull/585
NpmCommands
  .new
  .install('request-progress', 'inherits', 'klaw', 'caseless', 'qs',
           'har-validator', 'tunnel-agent') ||
  fail('Error while installing npm dependencies')

NpmCommands.new.install || fail('Error while installing npm dependencies')
