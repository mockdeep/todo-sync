# frozen_string_literal: true

require_relative "lib/todo_sync/version"

Gem::Specification.new do |spec|
  spec.name    = "todo_sync"
  spec.version = TodoSync::VERSION
  spec.authors = ["Robert Fletcher"]
  spec.email   = ["robert@boon.gl"]

  spec.summary  = "Manage your todo lists across multiple services"
  spec.homepage = "https://github.com/mockdeep/todo-sync"
  spec.license  = "MIT"

  spec.files         = `git ls-files lib util`.split($RS)
  spec.files        += ["README.md", "LICENSE.txt", "CODE_OF_CONDUCT.md"]
  spec.bindir        = "exe"
  exe_files = `git ls-files exe`.split($RS).map { |f| File.basename(f) }
  spec.executables   = exe_files
  spec.require_paths = ["lib"]

  spec.required_ruby_version = ">= 2.4"

  spec.add_dependency "activesupport", "~> 5.1"
  spec.add_dependency "json", "~> 2.1"
  spec.add_dependency "junk_drawer", "~> 1.5"
  spec.add_dependency "launchy", "~> 2.4"
  spec.add_dependency "rainbow", "~> 3.0"
  spec.add_dependency "tty-prompt", "~> 0.16"
  spec.add_dependency "typhoeus", "~> 1.3"

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "byebug", "~> 10.0"
  spec.add_development_dependency "coveralls", "~> 0.8.22"
  spec.add_development_dependency "guard", "~> 2.14"
  spec.add_development_dependency "guard-rspec", "~> 4.7"
  spec.add_development_dependency "guard-rubocop", "~> 1.3"
  spec.add_development_dependency "rake", "~> 12.3"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "rubocop", "0.57.2"
  spec.add_development_dependency "rubocop-rspec", "1.27.0"
  spec.add_development_dependency "simplecov", "~> 0.16"
  spec.add_development_dependency "vcr", "~> 4.0"
  spec.add_development_dependency "webmock", "~> 3.4"
end
