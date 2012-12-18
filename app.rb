require 'rubygems'
require 'sinatra'


get '/home' do
  send_file "index.html"
end