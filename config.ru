require "bundler"
rack_env = ENV.fetch("RACK_ENV", "development").to_sym

require "dotenv"
Dotenv.load ".env.#{rack_env}", ".env"

require "./application"

require 'lotus-router'

router = Lotus::Router.new do
  get  '/', to: "root#index"
end

run router
