# frozen_string_literal: true

require_relative "lib/csvbuilder/core/version"

Gem::Specification.new do |spec|
  spec.name = "csvbuilder-core"
  spec.version = Csvbuilder::Core::VERSION
  spec.authors = ["Joel Azemar"]
  spec.email = ["joel.azemar@gmail.com"]

  spec.summary       = "Csvbuilder Core contain the shared components of Csvbuilder"
  spec.description   = "Help handle CSVs in a more efficient way"

  spec.homepage = "https://github.com/joel/csvbuilder-core"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["changelog_uri"] = "https://github.com/joel/csvbuilder-core/blob/main/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "activesupport", "6.1.7"
  spec.metadata["rubygems_mfa_required"] = "true"
end
