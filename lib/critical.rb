# frozen_string_literal: true

require 'critical/version'
require 'json'
require 'open3'

# Calls the npm package "critical".
# See: https://github.com/addyosmani/critical
module Critical
  GEM_ROOT = File.expand_path('..', File.dirname(__FILE__)).freeze

  # For more information and available options, see:
  # https://github.com/addyosmani/critical
  def self.generate(options)
    out, err, st = Dir.chdir(GEM_ROOT) do
      Open3.capture3('node', 'lib/critical-wrapper.js', JSON.dump(options))
    end
    if !st.exitstatus.zero? || out.empty? && !err.empty?
      STDOUT.puts out
      STDERR.puts err
      fail "Failed to get critical CSS for:\n" +
           JSON.pretty_generate(options)
    end
    out
  end
end
