require "stringio"
require 'zip/zip'
require 'tempfile'
require 'escape'
require 'rbconfig'


def log(message, error = false)
  $stdout.puts "#{Time.now.strftime("%Y-%m-%d %H:%M:%S")} - #{message}" if (error or ARGV.include? "-v" or ARGV.include? "--verbose")
end
