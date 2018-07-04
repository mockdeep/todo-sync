# frozen_string_literal: true

RSpec.configure do |config|
  config.around do |example|
    # prevent `exit` calls which will exit the spec before assertions
    # rubocop:disable RSpec/ExpectInHook
    expect { example.run }.not_to raise_error
    # rubocop:enable RSpec/ExpectInHook
  end
end

def catch_exit
  yield
rescue SystemExit
  @exited = true
ensure
  raise "no exit call happened" unless @exited
end
