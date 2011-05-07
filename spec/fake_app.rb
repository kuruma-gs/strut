require 'action_controller/railtie'
require 'action_view/railtie'
#require 'mongoid'

# db
#Mongoid.configure do |config|
#  name = "mongoid_test"
#  config.master = Mongo::Connection.new.db(name)
#  config.logger = nil
#end

# config
app = Class.new Rails::Application
app.config.secret_token = "3b7cd727ee24e8444053437c36cc66c4"
app.config.session_store :cookie_store, :key => "_myapp_session"
app.config.active_support.deprecation = :log
app.initialize!

# routing
app.routes.draw do
  resources :users
end

# models
class User
#  include Mongoid::Document
end

# controllers
class ApplicationController < ActionController::Base;
  include Strut::Controller
end
class UsersController < ApplicationController
  strut_controller User
end

Object.const_set(:ApplicationHelper,Module.new)
