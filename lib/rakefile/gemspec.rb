GEMSPEC_FILE = Dir.glob('*.gemspec').first

unless GEMSPEC_FILE
  desc "Creates the gemspec file"
  task :gemspec do
    # TODO
  end
else
  load GEMSPEC_FILE

  desc "Updates the gemspec file"
  task :gemspec => GEMSPEC_FILE do
    gemspec = File.read(GEMSPEC_FILE)

    puts "Updating gemspec version..."
    version = File.read('VERSION').chomp
    gemspec.gsub!(/(gem\.version\s*=\s*')[^']*(')/, "\\1#{version}\\2")

    puts "Updating gemspec date..."
    date = File.mtime('VERSION').strftime('%Y-%m-%d')
    gemspec.gsub!(/(gem\.date\s*=\s*')[^']*(')/, "\\1#{date}\\2")

    puts "Updating gemspec file list..."
    files = FileList['[A-Z]*', 'bin/*', 'doc/[A-Z]+', 'doc/examples/**/*.rb', 'lib/**/*.rb', 'test/**/*', 'spec/**/*']
    files -= FileList['doc/rdoc', 'doc/rdoc/**/*', 'doc/yard', 'doc/yard/**/*'] # FIXME: use doc/.gitignore
    gemspec.gsub!(/(gem\.files\s*=\s*%w\()[^\)]*(\))/, "\\1#{files.to_a.sort.join(' ')}\\2")

    puts "Updating gemspec test file list..."
    files = FileList['test/**/*', 'spec/**/*']
    gemspec.gsub!(/(gem\.test_files\s*=\s*%w\()[^\)]*(\))/, "\\1#{files.to_a.sort.join(' ')}\\2")

    open(GEMSPEC_FILE, "wb") { |f| f.puts gemspec }
  end

  require 'rake/gempackagetask'
  package_task = Rake::GemPackageTask.new(GEMSPEC) do |pkg|
    pkg.need_zip = true
    pkg.need_tar = true
  end
end
