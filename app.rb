# frozen_string_literal: true

require 'sinatra'
require 'sinatra/reloader'
require 'pry'

also_reload 'lib/**/*.rb'

require_relative 'lib/tamagotchi'

get '/start' do
  Tamagotchi.clear
  Tamagotchi.new('Test Animal')

  redirect '/tamagotchis'
end

get '/tamagotchis' do
  @tamagotchis = Tamagotchi.all.map(&:to_json)

  erb :tamagotchis
end

get '/tamagotchis/:id' do
  @id = params[:id].to_i
  tamagotchi = Tamagotchi.find @id

  @tamagotchi = tamagotchi.to_json

  erb :tamagotchi
end

get '/tamagotchis/:id/:action' do
  id = params[:id].to_i
  action = params[:action]
  tamagotchi = Tamagotchi.find id
  tamagotchi.send(action.to_sym) if %w[eat play sleep].any? action # I know, it's just an exercise

  redirect "/tamagotchis/#{id}"
end
