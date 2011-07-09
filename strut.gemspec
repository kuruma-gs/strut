# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{strut}
  s.version = "0.0.4"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["kuruma3"]
  s.date = %q{2011-05-07}
  s.description = %q{instead scaffold controller}
  s.email = ["kuruma@galileoscope.com"]
  s.extra_rdoc_files = ["History.txt", "Manifest.txt", "PostInstall.txt"]
  s.files = ["History.txt", "Manifest.txt", "PostInstall.txt", "README.rdoc", "Rakefile", "lib/strut.rb", "lib/strut/controller.rb", "lib/strut/controller/action.rb", "lib/strut/controller/filter.rb", "lib/strut/controller/respond.rb", "lib/strut/model/action.rb", "lib/strut/model/holder.rb", "script/console", "script/destroy", "script/generate"]
  s.homepage = %q{http://github.com/#{github_username}/#{project_name}}
  s.post_install_message = %q{PostInstall.txt}
  s.rdoc_options = ["--main", "README.rdoc"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{strut}
  s.rubygems_version = %q{1.6.1}
  s.summary = %q{instead scaffold controller}

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<hoe>, [">= 2.9.1"])
    else
      s.add_dependency(%q<hoe>, [">= 2.9.1"])
    end
  else
    s.add_dependency(%q<hoe>, [">= 2.9.1"])
  end
end
