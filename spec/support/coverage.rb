# frozen_string_literal: true

require "simplecov"

SimpleCov.add_filter "/spec/"
SimpleCov.minimum_coverage 100

if ENV["CI"]
  require "coveralls"
  Coveralls.wear!
else
  SimpleCov.start
end
