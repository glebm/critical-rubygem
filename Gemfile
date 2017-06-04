# frozen_string_literal: true

source 'https://rubygems.org'

# Specify your gem's dependencies in critical.gemspec
gemspec

group :development, :test do
  gem 'byebug', platform: [:ruby], require: false
end

# HACK: npm install on bundle
unless $npm_commands_hook_installed # rubocop:disable Style/GlobalVars
  Gem.pre_install do |installer|
    next true unless installer.spec.name == 'critical'
    require_relative './ext/npm/install'
  end
  $npm_commands_hook_installed = true # rubocop:disable Style/GlobalVars
end
