# frozen_string_literal: true

source 'https://rubygems.org'

# Specify your gem's dependencies in critical.gemspec
gemspec

group :development, :test do
  gem 'byebug', platform: [:ruby], require: false
end

# HACK: install on bundle
unless $npm_commands_hook_installed # rubocop:disable Style/GlobalVars
  Gem.pre_install do |installer|
    next true unless installer.spec.name == 'critical'
    require_relative './lib/npm_commands'
    NpmCommands.new.install
  end
  $npm_commands_hook_installed = true # rubocop:disable Style/GlobalVars
end
