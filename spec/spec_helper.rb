require 'rubygems'
require 'rspec'
$:.unshift(File.dirname(__FILE__) + '/../lib')
require 'strut'
#require 'mongoid'
#require 'mocha'

require File.join(File.dirname(__FILE__), 'fake_app')


#Rspec.configure do |config|
#  config.mock_with(:mocha)
#  config.after(:suite) do
#    Mongoid.master.collections.select {|c| c.name !~ /system/ }.each(&:drop)
#  end
#end
