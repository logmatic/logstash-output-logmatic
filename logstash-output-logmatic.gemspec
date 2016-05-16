# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "logstash-output-logmatic"
  spec.version       = "0.2"
  spec.authors       = ["Logmatic support team", "Giovanni CLEMENT"]
  spec.email         = ["support@logmatic.io"]
  spec.summary       = "Logmatic output plugin for Logstash"
  spec.homepage      = "http://logmatic.io"
  spec.license       = "MIT"


  # Special flag to let us know this is actually a logstash plugin
  spec.metadata      = { "logstash_plugin" => "true", "logstash_group" => "output" }

  spec.files         = `git ls-files`.split("\n")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

#  spec.add_development_dependency "rake"
  spec.add_runtime_dependency 'logstash-core', ">= 1.5.3", "< 3.0.0"
#  spec.add_runtime_dependency "logstash-codec-plain"
end
