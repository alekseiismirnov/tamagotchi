# frozen_string_literal: true

require 'sinatra'
require 'sinatra/reloader'
require 'pry'

also_reload 'lib/**/*.rb'

require_relative 'lib/tamagotchi'

get '/start' do
  Tamagotchi.clear
  Tamagotchi.new('Testing Animal')

  redirect '/tamagotchis'
end

get '/tamagotchis' do
  @tamagotchis = Tamagotchi.all.map(&:to_json)

  erb :tamagotchis
end

get '/tamagotchis/:id' do
  @id = params[:id].to_i
  tamagotchi = Tamagotchi.find @id
  # buisiness logic:

  # view
  @tamagotchi = tamagotchi.to_json

  erb :tamagotchi
end
