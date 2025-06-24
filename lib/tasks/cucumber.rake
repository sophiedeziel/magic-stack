# frozen_string_literal: true

unless Rails.env.production?
  require 'cucumber/rake/task'

  namespace :cucumber do
    Cucumber::Rake::Task.new(:all) do |t|
      t.cucumber_opts = ['features', '--format progress']
    end

    Cucumber::Rake::Task.new(:wip) do |t|
      t.cucumber_opts = ['features', '--tags @wip', '--format progress']
    end

    Cucumber::Rake::Task.new(:rerun) do |t|
      t.cucumber_opts = ['@rerun.txt', '--format progress']
    end
  end

  desc 'Run all cucumber features'
  task cucumber: 'cucumber:all'
end
