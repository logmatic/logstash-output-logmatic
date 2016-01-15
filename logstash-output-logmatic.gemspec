Gem::Specification.new do |s|
  s.name = 'logstash-output-logmatic'
  s.version         = "0.1.3"
  s.licenses = ["GNU 2.0"]
  s.summary = "Logmatic Output"
  s.description = "Logmatic output for Logstash"
  s.authors = ["Giovanni CLEMENT","Renaud Boutet"]
  s.homepage = ""
  s.require_paths = ["lib"]

  # Files
  s.files = Dir['lib/**/*','spec/**/*','vendor/**/*','*.gemspec','*.md','CONTRIBUTORS','Gemfile','LICENSE','NOTICE.TXT']
   # Tests
  s.test_files = s.files.grep(%r{^(test|spec|features)/})

  # Special flag to let us know this is actually a logstash plugin
  s.metadata = { "logstash_plugin" => "true", "logstash_group" => "output" }

  # Gem dependencies
  s.add_runtime_dependency "logstash-core", "~> 1.5.3"
  s.add_runtime_dependency "logstash-codec-plain"
  s.add_development_dependency "logstash-devutils"
end
