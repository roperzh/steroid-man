require "oj"
require "patron"
require "elasticsearch"
require "lotus-controller"
require "lotus-view"
require "groff_parser"
require "sass"

# Require all application files.
Dir["./app/controllers/**/*.rb"].each  { |rb| require rb }
Dir["./app/layouts/**/*.rb"].each      { |rb| require rb }
Dir["./app/presenters/**/*.rb"].each   { |rb| require rb }
Dir["./app/views/**/*.rb"].each        { |rb| require rb }
Dir["./app/services/**/*.rb"].each     { |rb| require rb }

Lotus::View.root = 'app/templates'
Lotus::View.load!
