# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'i18n_accessors/version'

Gem::Specification.new do |spec|
  spec.name          = "i18n_accessors"
  spec.version       = I18nAccessors::VERSION
  spec.authors       = ["Chris Salzberg"]
  spec.email         = ["chris@dejimata.com"]

  spec.summary       = %q{Define locale-specific attribute accessors.}
  spec.homepage      = "https://github.com/shioyama/i18n_accessors"
  spec.license       = "MIT"

  spec.files        = Dir['{lib/**/*,[A-Z]*}']
  spec.require_paths = ["lib"]

  spec.add_dependency "i18n", ">= 0.6.10", "< 0.9"
  spec.add_development_dependency "rake", "~> 12.3.3"
  spec.add_development_dependency "rspec", "~> 3.0"
end
