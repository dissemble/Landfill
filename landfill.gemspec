# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "landfill/version"

Gem::Specification.new do |s|
  s.name        = "landfill"
  s.version     = Landfill::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Seth Plough"]
  s.email     = ["na@example.com"]
  s.homepage    = ""
  s.summary     = %q{GC Debugging}
  s.description = %q{Pass a block to Landfill.measure, much like Benchmark.ms, but for GC info}

  s.rubyforge_project = "landfill"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
  
  
  s.add_development_dependency("test/unit")
  s.add_dependency("mocha")
end
