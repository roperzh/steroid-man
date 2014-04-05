require "json"
require "lotus-controller"
require "lotus-view"
# require "lotus-utils"

# Require all application files.
Dir["./app/controllers/**/*.rb"].each  { |rb| require rb }
Dir["./app/views/**/*.rb"].each        { |rb| require rb }

