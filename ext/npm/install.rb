# frozen_string_literal: true

require_relative '../../lib/npm_commands'

NpmCommands.new.install('--production', '.') ||
  fail('Error while installing npm dependencies')
