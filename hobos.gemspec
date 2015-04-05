# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'hobos/version'

Gem::Specification.new do |spec|
  spec.name          = "hobos"
  spec.version       = Hobos::VERSION

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "mechanize"

  spec.authors       = ["Robert H Grayson II"]
  spec.email         = ["bobbygrayson@gmail.com"]
  spec.summary       = %q{Get your hobo on.}
  spec.description   = %q{See summary.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = ["hobos"]  

  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]
end
