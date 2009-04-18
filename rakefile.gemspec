#!/usr/bin/env ruby -rubygems
# -*- encoding: utf-8 -*-

GEMSPEC = Gem::Specification.new do |gem|
  gem.name               = 'rakefile'
  gem.version            = '0.0.1'
  gem.date               = '2009-04-18'
  gem.homepage           = 'http://github.com/bendiken/rakefile'
  gem.license            = 'MIT' if gem.respond_to?(:license=)
  gem.summary            = 'A KISS (Keep It Simple, Stupid) approach to gem Rakefiles.'
  gem.description        = <<-EOF
    This is a KISS (Keep It Simple, Stupid) approach to Rakefiles for Ruby gems.
  EOF
  gem.rubyforge_project  = nil

  gem.author             = 'Arto Bendiken'
  gem.email              = 'arto.bendiken@gmail.com'

  gem.platform           = Gem::Platform::RUBY
  gem.files              = %w(LICENSE README Rakefile VERSION lib/rakefile.rb lib/rakefile/gemspec.rb lib/rakefile/testunit.rb lib/rakefile/version.rb lib/rakefile/yard.rb)
  gem.bindir             = %q(bin)
  gem.executables        = %w()
  gem.default_executable = gem.executables.first
  gem.require_paths      = %w(lib)
  gem.extensions         = %w()
  gem.test_files         = %w()
  gem.has_rdoc           = false

  gem.required_ruby_version  = '>= 1.8.2'
  gem.requirements           = []
  gem.add_runtime_dependency 'rake'
  gem.post_install_message   = nil
end
