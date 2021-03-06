# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "psql_tasks"
  spec.version       = '0.0.1'
  spec.authors       = ["Vladimir Kochnev"]
  spec.email         = ["hashtable@yandex.ru"]
  spec.summary       = %q{Rake tasks for dealing with psql utility.}
  spec.description   = %q{Rake tasks for dealing with psql utility.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"

  spec.add_runtime_dependency "rake"
end
