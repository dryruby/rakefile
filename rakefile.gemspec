#!/usr/bin/env ruby -rubygems
# -*- encoding: utf-8 -*-

GEMSPEC = Gem::Specification.new do |gem|
  gem.name               = 'rakefile'
  gem.version            = '0.0.0.1'    # File.read('VERSION').chomp
  gem.date               = '2009-04-18' # File.mtime('VERSION')
  gem.homepage           = 'http://github.com/bendiken/rakefile'
  gem.license            = 'MIT'
  gem.summary            = 'A KISS (Keep It Simple, Stupid) approach to gem Rakefiles.'
  gem.description        = <<-EOF
    This is a KISS (Keep It Simple, Stupid) approach to Rakefiles for Ruby gems.
  EOF
  gem.rubyforge_project  = nil

  gem.author             = 'Arto Bendiken'
  gem.email              = 'arto.bendiken@gmail.com'

  gem.platform           = Gem::Platform::RUBY
  gem.files              = Dir.glob('{bin,doc,lib,test,spec}/**/*')
  gem.files              << %w(LICENSE README VERSION Rakefile)
  gem.bindir             = 'bin'
  gem.executables        = []
  gem.default_executable = gem.executables.first
  gem.require_path       = 'lib'
  gem.extensions         = []
  gem.test_files         = Dir.glob('{test,spec}/**/*')
  gem.has_rdoc           = false

  gem.required_ruby_version  = '>= 1.8.2'
  gem.requirements           = []
  gem.add_runtime_dependency 'rake'
  gem.post_install_message   = nil
end
