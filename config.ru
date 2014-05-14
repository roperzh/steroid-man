require "bundler"
rack_env = ENV.fetch("RACK_ENV", "development").to_sym

require "dotenv"
Dotenv.load ".env.#{rack_env}", ".env"

# All the requests going to /assets are handled by sprockets
require "sprockets"
map "/assets" do
  env = Sprockets::Environment.new
  env.append_path "app/assets/javascripts"
  env.append_path "app/assets/stylesheets"
  env.append_path "app/assets/images"

  run env
end

require "./application"
require 'lotus-router'
router = Lotus::Router.new do
  get  '/', to: "man_pages#index"
  resources :man_pages, only: [:index, :show]
end

run router
