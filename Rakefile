# frozen_string_literal: true

task :test

task default: :test

begin
  require 'rubocop/rake_task'
  RuboCop::RakeTask.new(:lint)
  task test: :lint
rescue LoadError
  task test: []
end

begin
  require 'rspec/core/rake_task'
  RSpec::Core::RakeTask.new(:spec)
  task test: :spec
rescue LoadError
  task test: []
end
