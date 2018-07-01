# frozen_string_literal: true

group :everything, halt_on_fail: true do
  guard :rspec, cmd: "bundle exec rspec" do
    require "guard/rspec/dsl"
    dsl = Guard::RSpec::Dsl.new(self)

    rspec = dsl.rspec
    watch(rspec.spec_helper) { rspec.spec_dir }
    watch(rspec.spec_support) { rspec.spec_dir }
    watch(rspec.spec_files)

    ruby = dsl.ruby
    dsl.watch_spec_files_for(ruby.lib_files)
  end

  guard :rubocop, cli: ["-a"] do
    watch(%r{exe/*})
    watch(/.+\.gemspec$/)
    watch(/.+\.rb$/)
    watch(%r{(?:.+/)?\.rubocop(?:_todo)?\.yml$}) { |m| File.dirname(m[0]) }
  end
end
