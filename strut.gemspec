# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)

require "strut/version"

Gem::Specification.new do |s|
  s.name        = "strut"
  s.version     = Strut::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["kuruma3"]
  s.email       = ["kuruma@galileoscope.com"]
  s.homepage    = %q{http://github.com/#{github_username}/#{project_name}}
  s.summary     = "instead scaffold controller"
  s.description = "instead scaffold controller"

  s.required_rubygems_version = ">= 1.3.6"
  s.add_dependency("rails", [">= 3.0.0"])
  s.add_dependency("mongoid", [">= 2.1.0"])
  s.add_dependency("kaminari", [">= 0.0.1"])

  s.files        = Dir.glob("lib/**/*") + %w(README.rdoc Rakefile)
  s.require_path = 'lib'
end
