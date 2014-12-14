require 'rake/testtask'

Rake::TestTask.new do |t|
  t.libs.push "lib", "specs/helpers"
  t.test_files = FileList['specs/*_spec.rb']
  t.verbose = true
end

task :default => :test
