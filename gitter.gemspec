# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'gitter/version'

Gem::Specification.new do |spec|
  spec.name          = "gitter"
  spec.version       = Gitter::VERSION
  spec.authors       = ["celeen"]
  spec.email         = ["celeenrusk@gmail.com"]

  spec.summary       = %q{Github backup}
  spec.description   = %q{Backs up github repos to a specificed local directory.}
  spec.homepage      = "TODO: Put your gem's website or public repo URL here."



  spec.files         = ['lib/gitter.rb']
  # spec.bindir        = "exe"
  spec.executables << 'gitter'
  spec.require_paths = ["lib"]

  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com' to prevent pushes to rubygems.org, or delete to allow pushes to any server."
  end

  spec.add_development_dependency "bundler", "~> 1.8"
  spec.add_development_dependency "rake", "~> 10.0"
  
  spec.add_runtime_dependency("commander", '~> 4.3.4')
  spec.add_runtime_dependency("octokit", ' ~> 3.0')
end
