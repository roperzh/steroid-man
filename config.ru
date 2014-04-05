require "bundler"
rack_env = ENV.fetch("RACK_ENV", "development").to_sym

require "dotenv"
Dotenv.load ".env.#{rack_env}", ".env"

require 'lotus-router'

router = Lotus::Router.new do
  get  '/hello', to: ->(env) { [200, {}, ['Hello, World!']] }
end

run router
