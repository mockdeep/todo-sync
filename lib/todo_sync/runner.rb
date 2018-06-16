# frozen_string_literal: true

module TodoSync
  # Runner parses args and starts the process
  class Runner
    include JunkDrawer::Callable
    include Util

    LINTERS = [
      Linter::MissingEstimate,
    ].freeze

    def call(args = ARGV)
      OptionParser.call(args)

      if config.lint
        output "about to lint, are you ready?"
        run_lints
        output tasks
      else
        output "no options given, what do you want me to do?"
      end
    end

    private

    def run_lints
      LINTERS.each { |linter| tasks.each(&linter) }
      output "all done!!!".color(:green)
      goodbye
    end

    def tasks
      @tasks ||= [OpenStruct.new(title: "some title")]
    end
  end
end
