require_relative './lib/immigrant_stories/version'

Gem::Specification.new do |spec|
  spec.authors       = ["Keo Bun"]
  spec.email         = ["keonilrath@gmail.com"]
  spec.date          = '2016-9-30'
  spec.description   = %q{Immigration Stories}
  spec.summary       = %q{Immigration Stories}
  spec.homepage      = "https://learn.co"

  spec.files         = ["lib/cli.rb", "lib/dreamer.rb", "lib/immigrants.rb", "lib/immigrants.rb", "config/environment.rb"]
  spec.executables   = ["immigrant_stories"]
  spec.name          = "immigrant_stories_gem"
  spec.require_paths = ["lib", "lib/immigrants"]
  spec.version       = Immigrants::VERSION
  spec.license       = "MIT"

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "nokogiri"
  spec.add_development_dependency "pry"
