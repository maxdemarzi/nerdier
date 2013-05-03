# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'nerdier/version'

Gem::Specification.new do |gem|
  gem.name          = "nerdier"
  gem.version       = Nerdier::VERSION
  gem.authors       = ["Max De Marzi"]
  gem.email         = ["maxdemarzi@hotmail.com"]
  gem.description   = "A Ruby Wrapper for the NERD REST API"
  gem.summary       = "It is a ruby gem which provides an interface to NERD http://nerd.eurecom.fr"
  gem.homepage      = "https://github.com/maxdemarzi/nerdier"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
  
  gem.add_dependency "httpclient", ">= 2.3.3"
  gem.add_dependency "json", ">= 1.6.0"
  gem.add_dependency "oj", ">= 2.0.12"
end
