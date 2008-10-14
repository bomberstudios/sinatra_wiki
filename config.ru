ENV['GEM_PATH'] = ENV['HOME'] + '/.gems'

require 'rubygems'
#require 'rack'
require 'sinatra'

Sinatra::Application.default_options.merge!(
  :run => false,
  :env => :production,
  :views => File.join(File.dirname(__FILE__), 'views'),
  :public => File.join(File.dirname(__FILE__), 'public')
)
         
require 'sinatra_wiki'

run Sinatra.application
