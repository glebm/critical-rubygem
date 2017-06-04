# frozen_string_literal: true

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'critical/version'

Gem::Specification.new do |spec|
  spec.name = 'critical'
  spec.version = Critical::VERSION
  spec.authors = ['Gleb Mazovetskiy']
  spec.email = ['glex.spb@gmail.com']

  spec.summary =
    'critical npm package (https://github.com/addyosmani/critical) Ruby wrapper'
  spec.homepage = 'https://github.com/glebm/critical-rubygem'
  spec.license = 'MIT'

  spec.files = Dir['{ext,lib}/**/*'] + %w[package.json package-lock.json]
  spec.require_paths = ['lib']
  spec.extensions = ['ext/npm/extconf.rb']

  spec.add_development_dependency 'bundler', '~> 1.15'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'rubocop', '~> 0.49.1'
end
