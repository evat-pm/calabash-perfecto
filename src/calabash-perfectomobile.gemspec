# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "calabash-perfectomobile/version"


                 
Gem::Specification.new do |s|
  s.name        = "calabash-perfectomobile"
  s.version     = Calabash::PerfectoMobile::VERSION
  #s.version     = "1.0"
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Rinat Ailon"]
  s.email       = ["rinat.eilon@gmail.com"]
  #s.homepage    = "http://github.com/calabash"
  s.summary     = %q{Client for calabash-perfectomobile for automated functional testing on Perfecto Mobile}
  s.description = %q{calabash-perfectomobile drives tests for apps on any device on Perfecto Mobile cloud. }
   
  
  s.files = Dir['lib/**/*'] + Dir['bin/**/*']
  s.files += Dir['[A-Z]*'] + Dir['docs/**/*'] + Dir['features-skeleton/**/*']

  s.executables   = "calabash-perfectomobile"
  s.require_paths = ["lib"]

  s.add_dependency( "cucumber" )
  s.add_dependency( "json" )
  s.add_dependency( "retriable", "~> 1.3.3.1" )
  s.add_dependency( "slowhandcuke" )
  s.add_dependency('zip-zip' )
  s.add_dependency( "awesome_print" )
  s.add_dependency( 'httpclient', '~> 2.3.2')
  s.add_dependency( 'xamarin-test-cloud', '>= 0.9.23')
  s.add_dependency( 'escape', '~> 0.0.4')
end
