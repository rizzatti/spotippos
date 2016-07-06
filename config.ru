require './config/environment'
require 'rabl'

Rabl.register!

run Hanami::Container.new
