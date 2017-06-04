# frozen_string_literal: true

require 'bundler/gem_tasks'
require 'rspec/core/rake_task'

desc 'Update critical to the latest npm release'
task :update do
  require 'npm_commands'
  NpmCommands.new.update

  require 'json'
  npm_package_lock = JSON.parse(File.read('package-lock.json'))
  npm_version = npm_package_lock['dependencies']['critical']['version']
  version_path = File.join('lib/critical/version.rb')
  File.write(
    version_path,
    File.read(version_path)
        .sub(/CRITICAL_VERSION = '.*?'/, "CRITICAL_VERSION = '#{npm_version}'")
  )
  STDERR.puts "Updated critical to v#{npm_version}"
end

RSpec::Core::RakeTask.new(:spec)

task default: :spec
