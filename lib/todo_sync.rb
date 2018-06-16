# frozen_string_literal: true

require "junk_drawer/callable"
require "rainbow/ext/string"

require_relative "todo_sync/util"
require_relative "todo_sync/configuration"
require_relative "todo_sync/option_parser"
require_relative "todo_sync/version"

require_relative "todo_sync/linter/missing_estimate"

require_relative "todo_sync/runner"

# Top level TodoSync namespace
module TodoSync
  def self.config
    @config ||= Configuration.new
  end
end
