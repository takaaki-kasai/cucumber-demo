# encoding: utf-8
RACK_ENV = 'test' unless defined?(RACK_ENV)

require 'capybara/cucumber'
require 'capybara/poltergeist'
require 'rspec/expectations'

Capybara.default_driver = :poltergeist
Capybara.javascript_driver = :poltergeist
Capybara.app_host = 'http://127.0.0.1:9292'
