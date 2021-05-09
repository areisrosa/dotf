Dir[File.join(File.dirname(__FILE__),"lib/**/lib")].each {|dir| $LOAD_PATH << dir}

require 'git-style-binary/command'

$dotf = File.join(ENV['HOME'], ".dotf")
