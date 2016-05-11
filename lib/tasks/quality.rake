# frozen_string_literal: true
begin
  require "brakeman"
  require "bundler/audit/task"
  require "reek/rake/task"
  require "rubocop/rake_task"

  Bundler::Audit::Task.new

  namespace :brakeman do
    desc "Check your code with Brakeman"
    task :check do
      result = Brakeman.run app_path: ".", print_report: true
      unless result.filtered_warnings.empty?
        exit Brakeman::Warnings_Found_Exit_Code
      end
    end
  end

  RuboCop::RakeTask.new do |task|
    task.fail_on_error = false
  end

  Reek::Rake::Task.new do |task|
    task.fail_on_error = false
  end

  namespace :quality do
    desc "Check your code quality and security"
    task check: ["rubocop", "reek", "brakeman:check", "bundle:audit"]

    namespace :check do
      desc "Check your code quality"
      task quality: %w(rubocop reek)

      desc "Check your code security"
      task security: ["brakeman:check", "bundle:audit"]
    end
  end

rescue StandardError => e
  puts "Quality check failed: #{e.message}"
end
