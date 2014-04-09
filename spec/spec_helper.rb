# force test environment
ENV["RACK_ENV"] = "test"

require "dotenv"
Dotenv.load ".env.test", ".env"

# register coverage results only on demand
if ENV["COVERAGE"]
  require "simplecov"
  SimpleCov.start do
    add_filter "/spec/"
    add_filter "/vendor/bundle"
  end
end

require "bundler"
Bundler.setup(:default, :test)

require "rack/test"
require "minitest/autorun"
require "minitest/unit"
require "minitest/spec"
require "mocha/mini_test"
require "faker"

require "minitest/ansi"
MiniTest::ANSI.use!

# allow usage of "context" like "describe"
module MiniTest
  class Spec
    class << self
      alias_method :context, :describe
    end
  end
end
