# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "gera/version"

Gem::Specification.new do |s|
  s.name        = "gera"
  s.version     = Gera::VERSION
  s.authors     = ["Francisco Barroso"]
  s.summary     = %q{Gera gem}
  s.description = %q{Gera gem}

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  s.add_development_dependency "rspec"
  s.add_development_dependency "rails"
  s.add_development_dependency "action_args"
  s.add_runtime_dependency "rails"
  s.add_runtime_dependency "action_args"
end
