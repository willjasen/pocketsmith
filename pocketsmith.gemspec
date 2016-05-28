# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'pocketsmith/version'

Gem::Specification.new do |spec|
  spec.name          = "pocketsmith"
  spec.version       = Pocketsmith::VERSION
  spec.authors       = ["willjasen"]
  spec.email         = ["willjasen@gmail.com"]
  spec.description   = %q{Connect to PocketSmith API}
  spec.summary       = %q{PocketSmith API}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"

  spec.add_development_dependency "minitest"
  spec.add_development_dependency "vcr"
  spec.add_development_dependency "webmock"

  spec.add_dependency "faraday"
  spec.add_dependency "json"

end
