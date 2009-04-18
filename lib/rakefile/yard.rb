require 'yard'
YARD::Rake::YardocTask.new do |yard|
  yard.files   = ['lib/**/*.rb', 'README*', 'LICENSE']
  yard.options = ['--output-dir=doc/yard']
end
