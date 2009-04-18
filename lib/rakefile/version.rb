desc "Displays the current version"
task :version => 'VERSION' do
  puts File.read('VERSION').chomp
end
