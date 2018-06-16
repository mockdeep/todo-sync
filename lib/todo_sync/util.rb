# frozen_string_literal: true

module TodoSync
  # convenience methods for accessing configuration and other globals
  module Util
    def config
      TodoSync.config
    end

    def output
      config.output
    end
  end
end
