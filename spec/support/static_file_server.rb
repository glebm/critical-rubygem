# frozen_string_literal: true

require 'socket'

module StaticFileServer
  class << self
    def start # rubocop:disable Metrics/MethodLength,Metrics/AbcSize
      @host = '127.0.0.1'
      @port = find_free_port
      rd, wt = IO.pipe
      @pid = fork do
        require 'webrick'
        rd.close
        server = WEBrick::HTTPServer.new(
          DocumentRoot: File.expand_path('spec/fixtures/static'),
          Port: @port,
          BindAddress: @host,
          StartCallback: lambda do
            # write "1", signal a server start message
            wt.write(1)
            wt.close
          end
        )
        trap('INT') { server.shutdown }
        server.start
      end
      wt.close
      # read a byte for the server start signal
      rd.read(1)
      rd.close
    end

    def stop
      Process.kill('INT', @pid)
    end

    def url
      "http://#{@host}:#{@port}"
    end

    def find_free_port
      server = TCPServer.new(@host, 0)
      port = server.addr[1]
      server.close
      port
    end
  end
end
