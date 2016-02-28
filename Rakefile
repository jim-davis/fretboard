$LOAD_PATH << File.dirname(File.expand_path(__FILE__)) + "/src"
#puts $LOAD_PATH

require 'rspec/core/rake_task'

require 'note'

task :foo do
  puts scale = [Note.new("C"), Note.new("D"), Note.new("E"), Note.new("F")]
end

RSpec::Core::RakeTask.new(:spec)



