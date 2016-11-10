# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'flipr'

Gem::Specification.new do |spec|
  spec.name          = "flipr"
  spec.version       = Flipr::VERSION
  spec.authors       = ["Kent Gruber"]
  spec.email         = ["kgruber1@emich.edu"]

  spec.summary       = %q{A command-line application for flip tables.}
  spec.description   = %q{A simple, configurable flip table / put table command-line application with optional rainbows.}
  spec.homepage      = "https://github.com/picatz/Flipr"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  #spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.executable    = "flipr"  
  spec.require_paths = ["lib"]

  spec.add_dependency "lolize"
  spec.add_dependency "colorize"
  spec.add_dependency "trollop"

  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end

