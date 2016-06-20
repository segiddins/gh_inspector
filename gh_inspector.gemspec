# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'gh_inspector/version'

Gem::Specification.new do |spec|
  spec.name          = 'gh_inspector'
  spec.version       = GhInspector::VERSION
  spec.authors       = ['Orta Therox', 'Felix Krause']
  spec.email         = ['orta.therox@gmail.com', 'gh_inspector@krausefx.com']

  spec.summary       = 'Search through GitHub issues for your project for existing issues about a Ruby Error.'
  spec.homepage      = 'https://github.com/orta/gh_inspector'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.11'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'rubocop'
end