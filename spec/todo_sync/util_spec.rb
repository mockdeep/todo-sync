# frozen_string_literal: true

RSpec.describe TodoSync::Util do
  let(:test_class) { Class.new { include TodoSync::Util } }
  let(:test_instance) { test_class.new }
  let(:output) { StringIO.new }
  let(:input) { StringIO.new }

  before do
    TodoSync.config.output = output
    TodoSync.config.input = input
  end

  def add_input(text)
    # input.reopen
    input.write(text)
    input.rewind
  end

  def expect_exit(&block)
    expect(&block).to raise_error(SystemExit)
  end

  describe "#config" do
    it "returns the global configuration" do
      expect(test_instance.config.output).to be output
    end
  end

  describe "#output" do
    it "outputs the given text" do
      test_instance.output("foo")
      expect(output.string).to eq "foo\n"
    end
  end

  describe "#input" do
    it "prints the given text without a newline" do
      test_instance.input("buzz > ")
      expect(output.string).to eq "buzz > "
    end

    it "gets input from the user" do
      input << "futz\n"
      input.rewind
      result = test_instance.input("buzz > ")
      expect(result).to eq "futz\n"
    end
  end

  describe "#select_from" do
    let(:values) { ["yabba", "dabba", "doo"] }

    it "prints out the values with indexes" do
      add_input("1")
      test_instance.select_from(values)
      expect(output.string).to eq "1. yabba\n2. dabba\n3. doo\n> "
    end

    it "returns the appropriate value when a valid number is input" do
      add_input("2")
      expect(test_instance.select_from(values)).to eq "dabba"
    end

    context "when user inputs non-number" do
      it "outputs an error message and prompts user again" do
        add_input("blah\n1")
        test_instance.select_from(values)
        yabba_dabba = "1. yabba\n2. dabba\n3. doo\n> "
        error = "\n!!! please enter a valid option !!!".color(:red)
        expect(output.string).to eq "#{yabba_dabba}#{error}\n#{yabba_dabba}"
      end
    end

    context "when user inputs number out of range" do
      it "outputs an error message and prompts user again" do
        add_input("52\n1")
        test_instance.select_from(values)
        yabba_dabba = "1. yabba\n2. dabba\n3. doo\n> "
        error = "\n!!! please enter a valid option !!!".color(:red)
        expect(output.string).to eq "#{yabba_dabba}#{error}\n#{yabba_dabba}"
      end
    end

    it "exits when no input is given" do
      expect_exit { test_instance.select_from(values) }
    end
  end

  describe "#goodbye" do
    it "exits" do
      expect_exit { test_instance.goodbye }
    end

    it "prints an exit message" do
      expect_exit { test_instance.goodbye }
      expect(output.string).to eq "\ngoodbye".color(:yellow) + "\n"
    end
  end
end
