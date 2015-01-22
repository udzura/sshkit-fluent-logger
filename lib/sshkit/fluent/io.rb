require 'sshkit'
require 'uri'
require 'forwardable'
require 'fluent-logger'

module SSHKit
  module Fluent
    class IO
      extend Forwardable

      def initialize(io)
        @original_output = io
        self.fluent_url = 'tcp://localhost:24224'
        self.fluent_tag = ''
      end
      attr_reader :original_output,
        :fluent_client, :fluent_host, :fluent_port
      attr_accessor :fluent_tag

      def_delegators :@original_output, :read, :rewind

      def fluent_url=(url)
        parsed_url = URI.parse(url)
        @fluent_host = parsed_url.host
        @fluent_port = parsed_url.port || 24224

        @fluent_client = reinit_client
      end

      def write(data)
        original_output.write(data)

        fluent_client.post(fluent_tag, {"message" => data})
      end
      alias :<< :write

      private

      # TODO prefix if needed
      def reinit_client
        ::Fluent::Logger::FluentLogger.open(nil, :host => fluent_host, :port => fluent_port)
      end
    end
  end
end
