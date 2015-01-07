require 'httpclient'
require 'json'
require 'net/http'
require 'open-uri'
require 'rubygems'
require 'json'
require 'socket'
require 'timeout'
require 'calabash-perfectomobile/helpers'
require 'calabash-perfectomobile/version'
require 'calabash-perfectomobile/env'
require 'retriable'
require 'cucumber'
require 'calabash-perfectomobile/perfectomobile_actions'
require 'calabash-perfectomobile/perfectomobile_helper'

module Calabash module Android

module Operations
  #include Calabash::Android::WaitHelpers
  #include Calabash::Android::TouchHelpers
 
  def log(message)
    $stdout.puts "#{Time.now.strftime("%Y-%m-%d %H:%M:%S")} - #{message}" if (ARGV.include? "-v" or ARGV.include? "--verbose")
  end

  def macro(txt)
    if self.respond_to?(:step)
      step(txt)
    else
      Then(txt)
    end
  end
end
end
end



 
 
