require 'yaml'
if File.exists?(RUBYFORGE_CONFIG_FILE = File.expand_path('~/.rubyforge/config.yml'))
  if (RUBYFORGE_CONFIG = YAML.load(File.read(RUBYFORGE_CONFIG_FILE))) && (RUBYFORGE_PROJECT = GEMSPEC.rubyforge_project)

    namespace :rubyforge do
      desc "Publish the YARD documentation to RubyForge"
      task :docs => :yardoc do
        sh "rsync -avz doc/yard/ #{RUBYFORGE_CONFIG['username']}@rubyforge.org:/var/www/gforge-projects/#{RUBYFORGE_PROJECT}/"
      end
    end
  end
end
