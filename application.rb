require "oj"
require "patron"
require "elasticsearch"
require "lotus-controller"
require "lotus-view"

# Require all application files.
Dir["./app/controllers/**/*.rb"].each  { |rb| require rb }
Dir["./app/views/**/*.rb"].each        { |rb| require rb }
Dir["./app/services/**/*.rb"].each     { |rb| require rb }

