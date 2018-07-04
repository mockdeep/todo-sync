# frozen_string_literal: true

RSpec.describe TodoSync::Runner do
  let(:runner) { described_class.new }
  let(:output) { StringIO.new }
  let(:input) { StringIO.new }

  before do
    TodoSync.config.output = output
    TodoSync.config.input = input
    input << "1"
    input.rewind
  end

  context "when given a --lint argument" do
    it "runs the linters" do
      linter_class = TodoSync::Linter::MissingEstimate

      expect do
        runner.call(["--lint"])
      end.to invoke(:to_proc).on(linter_class).and_call_original
    end

    it "outputs the tasks" do
      runner.call(["--lint"])
      expect(output.string).to match(/some title/)
    end

    it "outputs a goodbye message" do
      runner.call(["--lint"])

      expect(output.string).to match(/all done/)
    end
  end

  context "when not given a --lint argument" do
    it "outputs a message" do
      runner.call([])
      expect(output.string).to match(/what do you want me to do/)
    end
  end
end
