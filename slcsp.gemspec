# frozen_string_literal: true

require_relative "lib/slcsp/version"

Gem::Specification.new do |spec|
  spec.name = "slcsp"
  spec.version = Slcsp::VERSION
  spec.authors = ["Simon Bagreev"]
  spec.email = ["sbagreev@gmail.com"]

  spec.summary = "Ad Hoc home assignment"
  spec.description = "Calculate the second lowest cost silver plan"
  spec.homepage = "https://github.com/semmin/slcsp"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata["allowed_push_host"] = "https://rubygems.org"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/semmin/slcsp"
  spec.metadata["changelog_uri"] = "https://github.com/semmin/slcsp/Changelog.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "pry", "~> 0.14"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
