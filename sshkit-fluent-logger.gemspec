# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'sshkit/fluent/logger/version'

Gem::Specification.new do |spec|
  spec.name          = "sshkit-fluent-logger"
  spec.version       = Sshkit::Fluent::Logger::VERSION
  spec.authors       = ["Uchio KONDO"]
  spec.email         = ["udzura@udzura.jp"]
  spec.summary       = %q{sshkit extention, which sends log to fluentd server}
  spec.description   = %q{sshkit extention, which sends log to fluentd server .}
  spec.homepage      = "https://github.com/udzura/sshkit-fluent-logger"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "fluent-logger"

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
end
