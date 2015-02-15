# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'record_with_operator/version'

Gem::Specification.new do |spec|
  spec.name          = "record_with_operator"
  spec.version       = RecordWithOperator::VERSION
  spec.authors       = ["yuitowest"]
  spec.email         = ["yuito@timedia.co.jp"]
  spec.description   = %q{Rails plugin to use OP}
  spec.summary       = %q{}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
