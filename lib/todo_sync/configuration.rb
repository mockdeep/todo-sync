# frozen_string_literal: true

module TodoSync
  # loads in configurations from `yml` and command line
  class Configuration
    attr_accessor :input, :lint, :output

    DEFAULT_SETTINGS = {
      lint: false,
      output: $stdout,
      input: $stdin,
    }.freeze

    def initialize
      DEFAULT_SETTINGS.each do |name, value|
        public_send("#{name}=", value)
      end
    end
  end
end
