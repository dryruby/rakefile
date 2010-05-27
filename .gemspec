#!/usr/bin/env ruby -rubygems
# -*- encoding: utf-8 -*-

GEMSPEC = Gem::Specification.new do |gem|
  gem.version            = File.read('VERSION').chomp
  gem.date               = File.mtime('VERSION').strftime('%Y-%m-%d')

  gem.name               = 'rakefile'
  gem.homepage           = 'http://github.com/bendiken/rakefile'
  gem.license            = 'Public Domain' if gem.respond_to?(:license=)
  gem.summary            = 'A KISS (Keep It Simple, Stupid) approach to gem Rakefiles.'
  gem.description        = <<-EOF
    This is a KISS (Keep It Simple, Stupid) approach to Rakefiles for Ruby gems.
  EOF
  gem.rubyforge_project  = 'rakefile'

  gem.authors            = ['Arto Bendiken']
  gem.email              = 'arto.bendiken@gmail.com'

  gem.platform           = Gem::Platform::RUBY
  gem.files              = %w(AUTHORS README UNLICENSE VERSION) + Dir.glob('lib/**/*.rb')
  gem.bindir             = %q(bin)
  gem.executables        = %w()
  gem.default_executable = gem.executables.first
  gem.require_paths      = %w(lib)
  gem.extensions         = %w()
  gem.test_files         = %w()
  gem.has_rdoc           = false

  gem.required_ruby_version      = '>= 1.8.2'
  gem.requirements               = []
  gem.add_runtime_dependency    'rake'
  gem.add_runtime_dependency    'rubyforge'
  gem.add_runtime_dependency    'yard'
  gem.post_install_message       = nil
end
