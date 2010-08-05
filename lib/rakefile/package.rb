desc "Builds the .tgz, .tbz and .zip archives"
task :package => ['VERSION', '.gemspec'] do
  eval(File.read('.gemspec'))
  package = GEMSPEC.name.to_s
  version = GEMSPEC.version.to_s
  sh "git archive --prefix=#{package}-#{version}/ --format=tar #{version} | gzip > pkg/#{package}-#{version}.tgz"
  sh "git archive --prefix=#{package}-#{version}/ --format=tar #{version} | bzip2 > pkg/#{package}-#{version}.tbz"
  sh "git archive --prefix=#{package}-#{version}/ --format=zip #{version} > pkg/#{package}-#{version}.zip"
  sh "chmod a-w pkg/#{package}-#{version}.{tgz,tbz,zip}"
end
