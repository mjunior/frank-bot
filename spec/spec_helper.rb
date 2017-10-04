require_relative '../app.rb'
require 'rspec'
require 'rack/test'

set :environment, :test


module RSpecMixin do
  include Rack::Test::Methods

  def app
    App
  end
end

RSpec.configure do |c|
  c.include RSpecMixin
end