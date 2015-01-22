require 'sshkit'
require 'sshkit/formatters/abstract'
require 'sshkit/formatters/pretty'
require 'sshkit/fluent/io'

module SSHKit
  module Formatter
    class Fluent < Pretty
      def initialize(oio)
        @original_output = SSHKit::Fluent::IO.new(oio)
      end
    end
  end
end
