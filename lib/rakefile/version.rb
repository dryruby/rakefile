unless File.exists?('VERSION')
  File.open('VERSION') { |f| f.puts "0.0.0" }
end

PROJECT_VERSION = File.read('VERSION').chomp

desc "Displays the current version"
task :version => 'VERSION' do puts PROJECT_VERSION end
