# frozen_string_literal: true

module TodoSync
  # Runner parses args and starts the process
  class Runner
    include JunkDrawer::Callable

    def call(args = ARGV)
      OptionParser.call(args)
    end
  end
end
