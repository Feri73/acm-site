# Set up gems listed in the Gemfile.
ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../../Gemfile', __FILE__)
RAILS_ROOT = "#{File.dirname(__FILE__)}/acm"# unless defined?(RAILS_ROOT)
require 'bundler/setup' if File.exist?(ENV['BUNDLE_GEMFILE'])
