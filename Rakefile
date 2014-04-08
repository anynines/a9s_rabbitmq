# encoding: utf-8

require 'rubygems'
require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end
require 'rake'

require 'jeweler'
Jeweler::Tasks.new do |gem|
  # gem is a Gem::Specification... see http://guides.rubygems.org/specification-reference/ for more options
  gem.name = "a9s_rabbitmq"
  gem.homepage = "http://github.com/anynines/a9s_rabbitmq"
  gem.license = "MIT"
  gem.summary = %Q{a9s_rabbitmq is a small utility gem to ease up the usage of the anyines.com rabbitmq service within your applications.}
  gem.description = %Q{a9s_rabbitmq is a small utility gem to ease up the usage of the anyines.com rabbitmq service within your applications.}
  gem.email = "jweber@anynines.com"
  gem.authors = ["Julian Weber"]
  # dependencies defined in Gemfile
end
Jeweler::RubygemsDotOrgTasks.new

require 'rake/testtask'
Rake::TestTask.new(:test) do |test|
  test.libs << 'lib' << 'test'
  test.pattern = 'test/**/test_*.rb'
  test.verbose = true
end

desc "Code coverage detail"
task :simplecov do
  ENV['COVERAGE'] = "true"
  Rake::Task['test'].execute
end

task :default => :test

require 'rdoc/task'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "a9s_rabbitmq #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

desc 'Run an irb console session'
task :irb_console do
  exec("irb -r ./lib/a9s_rabbitmq.rb")
end

task irb: :irb_console