require 'tempfile'
require 'json'
require "rubygems"


def msg(title, &block)
  puts "\n" + "-"*10 + title + "-"*10
  block.call
  puts "-"*10 + "-------" + "-"*10 + "\n"
end


def is_json?(str)
  str[0..0] == '{'
end
