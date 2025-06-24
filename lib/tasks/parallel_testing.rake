# frozen_string_literal: true

namespace :parallel do
  desc 'Run RSpec tests in parallel'
  task spec: :environment do
    system('parallel_rspec spec/')
  end

  desc 'Run Cucumber tests in parallel'
  task cucumber: :environment do
    system('parallel_cucumber features/')
  end

  desc 'Setup test databases for parallel testing'
  task setup: :environment do
    system('rake parallel:setup')
  end

  desc 'Drop test databases for parallel testing'
  task drop: :environment do
    system('rake parallel:drop')
  end

  desc 'Run all tests in parallel'
  task all: %i[spec cucumber]
end
