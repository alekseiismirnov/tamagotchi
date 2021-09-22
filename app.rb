# frozen_string_literal: true

require 'sinatra'
require 'sinatra/reloader'
require 'pry'

also_reload 'lib/**/*.rb'

require_relative 'lib/tamagotchi'

get '/tamagotchis' do
  erb :tamagotchis
end
