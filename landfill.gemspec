# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "landfill/version"

Gem::Specification.new do |s|
  s.name        = "landfill"
  s.version     = Landfill::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Seth Plough"]
  s.email       = ["TODO: Write your email address"]
  s.homepage    = ""
  s.summary     = %q{TODO: Write a gem summary}
  s.description = %q{TODO: Write a gem description}

  s.rubyforge_project = "landfill"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
  
  
  s.add_development_dependency("test/unit")
  s.add_dependency("mocha")
end
