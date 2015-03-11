# encoding: utf-8
RACK_ENV = 'test' unless defined?(RACK_ENV)
require_relative '../../test_rack_app'

require 'capybara/cucumber'
require 'capybara/poltergeist'
require 'rspec/expectations'

Capybara.app = TestRackApp.new
Capybara.javascript_driver = :poltergeist
