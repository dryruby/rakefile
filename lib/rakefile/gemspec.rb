desc "Updates the gemspec file"
task :gemspec do
  if gemspec_file = Dir.glob('*.gemspec').first
    load gemspec_file
    gemspec = File.read(gemspec_file)

    puts "Updating gemspec version..."
    version = File.read('VERSION').chomp
    gemspec.gsub!(/(gem\.version\s*=\s*')[^']+(')/, "\\1#{version}\\2")

    puts "Updating gemspec date..."
    date = File.mtime('VERSION').strftime('%Y-%m-%d')
    gemspec.gsub!(/(gem\.date\s*=\s*')[^']+(')/, "\\1#{date}\\2")

    puts "Updating gemspec file list..."
    files = FileList['[A-Z]*', 'bin/*', 'doc/**/*', 'lib/**/*.rb', 'test/**/*', 'spec/**/*']
    gemspec.gsub!(/(gem\.files\s*=\s*%w\()[^\)]*(\))/, "\\1#{files.to_a.sort.join(' ')}\\2")

    puts "Updating gemspec test file list..."
    files = FileList['test/**/*', 'spec/**/*']
    gemspec.gsub!(/(gem\.test_files\s*=\s*%w\()[^\)]*(\))/, "\\1#{files.to_a.sort.join(' ')}\\2")

    open(gemspec_file, "wb") { |f| f.puts gemspec }
  end
end
