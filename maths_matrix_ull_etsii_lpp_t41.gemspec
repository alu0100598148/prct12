# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'maths_matrix_ull_etsii_lpp_t41/version'

Gem::Specification.new do |spec|
  spec.name          = "maths_matrix_ull_etsii_lpp_t41"
  spec.version       = MathsMatrixUllEtsiiLppT41::VERSION
  spec.authors       = ["Oliver Valido", "Rodrigo Colombo"]
  spec.email         = ["alu0100598148@ull.edu.es", "alu0100630572@ull.edu.es"]
  spec.description   = %q{Clases que permiten trabajar con matrices densas y dispersas}
  spec.summary       = %q{Conjunto de clases para matrices densas y dispersas}
  spec.homepage      = "https://github.com/alu0100630572/prct09"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
