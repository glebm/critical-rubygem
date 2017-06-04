# frozen_string_literal: true

# NPM wrapper with helpful error messages
class NpmCommands
  # @return [Boolean] whether the installation succeeded
  def install(*args) # rubocop:disable Metrics/MethodLength
    return false unless check_nodejs_installed
    STDERR.puts 'Installing npm dependencies...'
    success = in_gem_root do
      system('npm', 'install', *args)
    end
    STDERR.puts(
      *if success
         ['npm dependencies installed']
       else
         ['-' * 60,
          'Error: npm dependencies installation failed',
          '-' * 60]
       end
    )
    success
  end

  # @return [Boolean] whether the update succeeded
  def update(*args) # rubocop:disable Metrics/MethodLength
    return false unless check_nodejs_installed
    STDERR.puts 'Updating npm dependencies...'
    success = in_gem_root do
      system('npm', 'update', *args)
    end
    STDERR.puts(
      *if success
         ['npm dependencies updated']
       else
         ['-' * 60,
          'Error: npm dependencies update failed',
          '-' * 60]
       end
    )
    success
  end

  private

  def in_gem_root
    Dir.chdir File.expand_path('..', File.dirname(__FILE__)) do
      yield
    end
  end

  def check_nodejs_installed # rubocop:disable Metrics/MethodLength
    return true if executable?('node')
    STDERR.puts(
      '-' * 60,
      'Error: critical requires NodeJS and NPM.',
      *if executable?('brew')
         ['  To install NodeJS and NPM, run:',
          '  brew install node']
       elsif Gem.win_platform?
         ['  To install NodeJS and NPM, we recommend:',
          '  https://github.com/coreybutler/nvm-windows/releases']
       else
         ['  To install NodeJS and NPM, we recommend:',
          '  https://github.com/creationix/nvm']
       end,
      '-' * 60
    )
  end

  def executable?(cmd)
    exts = ENV['PATHEXT'] ? ENV['PATHEXT'].split(';') : ['']
    ENV['PATH'].split(File::PATH_SEPARATOR).each do |path|
      exts.each do |ext|
        exe = File.join(path, "#{cmd}#{ext}")
        return exe if File.executable?(exe) && !File.directory?(exe)
      end
    end
    nil
  end
end
