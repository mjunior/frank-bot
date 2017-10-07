require 'json'
require 'sinatra'
require 'sinatra/activerecord'

require './config/database'

Dir['./app/models/*.rb'].each {|model| require model } 

class App < Sinatra::Base
  get '/sinatra' do
    'Hello World'
  end

end