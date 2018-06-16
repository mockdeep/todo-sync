# frozen_string_literal: true

module TodoSync
  # convenience methods for accessing configuration and other globals
  module Util
    def config
      TodoSync.config
    end

    def output(text)
      config.output.puts text
    end

    def input(text)
      config.output.print text
      STDIN.gets
    end

    def select_from(values)
      output_indexed(values)

      text = input_or_exit

      index = cast_integer(text)
      index &&= index - 1

      return values[index] if index && values[index]

      output "!!! please enter a valid option !!!".color(:red)

      select_from(values)
    end

    def output_indexed(collection)
      collection.each_with_index do |item, index|
        output "#{index + 1}. #{item}"
      end
    end

    def goodbye
      output "\ngoodbye".color(:yellow)
      exit
    end

    def input_or_exit
      input("> ") || goodbye
    end

    def cast_integer(text)
      Integer(text)
    rescue ArgumentError
      false
    end
  end
end
