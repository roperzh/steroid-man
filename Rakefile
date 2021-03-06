require "bundler"
rack_env = ENV.fetch("RACK_ENV", "development").to_sym
Bundler.setup(:default, rack_env)

# ensure our application is in the $LOAD_PATH
libdir = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(libdir) unless $LOAD_PATH.include?(libdir)

require "rake/testtask"
require "rake/clean"

CLEAN.push "coverage"

# Load environment variables from .env files
# (gives priority to local files too)
task :environment do
  require "dotenv"
  Dotenv.load ".env.#{rack_env}", ".env"
end

Rake::TestTask.new(:spec) do |t|
  t.libs << "spec"
  t.pattern = "spec/**/*_spec.rb"
  t.verbose = true
end
task :default => :spec

desc "Run tests for spec with coverage"
task "spec:coverage" do
  ENV["COVERAGE"] = "true"
  Rake::Task["spec"].invoke
end

desc "Start a console"
task :console do
  ENV["RACK_ENV"] ||= "development"
  %w(irb irb/completion).each { |r| require r }
  require_relative "application"

  ARGV.clear
  IRB.start
end

desc "Load man-pages information in the elasticsearch cluster"
task :populate do
  require "./application.rb"

  Populator.populate(
    GroffParser::Engine.new("/usr/share/man/man1"),
    ManIndexer.new(Elasticsearch::Client.new(host: ENV["ELASTICSEARCH_URL"]), "man_pages")
  )
end
