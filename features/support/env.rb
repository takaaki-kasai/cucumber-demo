# encoding: utf-8
RACK_ENV = 'test' unless defined?(RACK_ENV)
require_relative '../../test_rack_app'

require 'capybara/cucumber'
require 'capybara/poltergeist'
require 'rspec/expectations'

Capybara.app = TestRackApp.new
Capybara.default_driver = :poltergeist
Capybara.javascript_driver = :poltergeist
#Capybara.app_host = 'http://127.0.0.1:9292'
