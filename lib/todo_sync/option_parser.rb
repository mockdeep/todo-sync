# frozen_string_literal: true

require "optparse"

module TodoSync
  # wrapper around ruby's OptionParser
  class OptionParser
    include JunkDrawer::Callable
    include TodoSync::Util

    OPTIONS = {
      lint: ["-l", "--lint", "lint tasks for missing information"].freeze,
      help: ["-h", "--help", "prints this help"].freeze,
    }.freeze

    def call(args)
      parser.banner = "Usage: todo-sync [options]"

      OPTIONS.each { |name, flags| parser.on(*flags, &method(name)) }

      parser.parse!(args)
    end

    private

    def parser
      @parser ||= ::OptionParser.new
    end

    def lint(*)
      output.puts "linting!!!"
      config.lint = true
    end

    def help(*)
      output.puts parser
      exit
    end
  end
end
