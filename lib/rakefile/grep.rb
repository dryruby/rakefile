def egrep(pattern, files)
  Dir[files].each do |file|
    File.open(file).readlines.each_with_index do |line, lineno|
      puts "#{file}:#{lineno + 1}:#{line}" if line =~ pattern
    end
  end
end

desc 'Look for TODO and FIXME tags in the code base.'
task :todo do
  egrep /#.*(FIXME|TODO)/, '**/*.rb'
end
