lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "impacto_ambiental/version"

Gem::Specification.new do |spec|
  spec.name          = "impacto_ambiental"
  spec.version       = ImpactoAmbiental::VERSION
  spec.authors       = ["Carlos Fernandez Donate"]
  spec.email         = ["alu0100844665@ull.edu.es"]

  spec.summary       = "A gem to calculate the environmental impact"
  spec.homepage      = "https://github.com/ULL-ESIT-LPP-1920/tdd-alu0100844665"
  spec.license       = "MIT"

  spec.metadata["allowed_push_host"] = "http://mygemserver.com"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/ULL-ESIT-LPP-1920/tdd-alu0100844665"
  spec.metadata["changelog_uri"] = "https://github.com/ULL-ESIT-LPP-1920/tdd-alu0100844665/blob/master/README.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
