lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'hash_dig_and_collect/version'

Gem::Specification.new do |spec|
  spec.name          = "ruby_dig_and_collect"
  spec.version       = HashDigAndCollect::VERSION
  spec.authors       = ["Alfredo Motta"]
  spec.summary       = %q{Utility method build on top of Ruby dig to navigate hashes mixed up with arrays.}
  spec.homepage      = "https://github.com/mottalrd/hash_dig_and_collect"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "pry-nav"
end
