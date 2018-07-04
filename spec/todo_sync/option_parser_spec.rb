# frozen_string_literal: true

RSpec.describe TodoSync::OptionParser do
  let(:parser) { described_class.new }
  let(:output) { StringIO.new }

  before do
    TodoSync.config.output = output
  end

  context "when given a --lint argument" do
    it "sets config.lint" do
      expect do
        parser.call(["--lint"])
      end.to change(TodoSync.config, :lint).from(false).to(true)
    end
  end

  context "when given a --help argument" do
    it "prints help output" do
      catch_exit { parser.call(["--help"]) }

      expect(output.string).to match(/Usage:/)
        .and match(/--lint\s+lint tasks for missing/)
        .and match(/--help\s+prints this help/)
    end

    it "exits" do
      expect do
        parser.call(["--help"])
      end.to raise_error(SystemExit)
    end
  end
end
