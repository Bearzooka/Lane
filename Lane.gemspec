
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "Lane/version"

Gem::Specification.new do |spec|
  spec.name          = "Lane-Reporter"
  spec.version       = Lane::VERSION
  spec.authors       = ["Bearzooka"]
  spec.email         = ["bprieto@gmail.com"]
  spec.date        = Time.now.utc.strftime('%Y-%m-%d')

  spec.summary       = "≈≈≈ Lane is a real-life reporter for JSS. ≈≈≈"
  spec.homepage      = "https://github.com/Bearzooka/Lane"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "https://rubygems.org/"

    spec.metadata["homepage_uri"] = spec.homepage
    spec.metadata["source_code_uri"] = "https://github.com/Bearzooka/Lane"
    spec.metadata["changelog_uri"] = "https://github.com/Bearzooka/Lane"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files       = Dir['lib/**/*']
  spec.files      += Dir['data/**/*']
  spec.files      += Dir['bin/**/*']
  spec.extra_rdoc_files = ['README.md', 'LICENSE.txt']
  spec.executables << 'Lane'

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "ruby-jss", "~> 1.0.2"
  spec.add_runtime_dependency "ruby-jss", "~> 1.0.2"
end
