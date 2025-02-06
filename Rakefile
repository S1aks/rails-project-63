# frozen_string_literal: true

require 'bundler/gem_tasks'
require 'minitest/test_task'
require 'rubocop/rake_task'

Minitest::TestTask.create

RuboCop::RakeTask.new do |task|
  task.requires << 'rubocop-minitest'
  task.requires << 'rubocop-rake'
end

task default: :test
