# frozen_string_literal: true

RSpec.describe TodoSync do
  describe ".config" do
    it "returns the configuration" do
      config = described_class.config

      expect(config.output).to be STDOUT
    end
  end
end
