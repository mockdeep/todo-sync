# frozen_string_literal: true

require "ostruct"

module TodoSync
  module Linter
    # checks that tasks have an estimate
    class MissingEstimate
      include JunkDrawer::Callable
      include Util

      ESTIMATES = [
        "2 minutes",
        "5 minutes",
        "10 minutes",
        "15 minutes",
        "30 minutes",
        "1 hour",
      ].freeze

      def call(task)
        return if task.estimate

        output "task missing estimate: #{task.title.color(:green)}"
        task.estimate = select_from(ESTIMATES)
        output "set to #{task.estimate.color(:blue)}"
      end
    end
  end
end
