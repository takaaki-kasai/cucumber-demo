# encoding: utf-8
RACK_ENV = 'test' unless defined?(RACK_ENV)
require_relative '../../test_rack_app'

require 'rspec'
require 'rack/test'

include Rack::Test::Methods

def app
  TestRackApp.new
end
