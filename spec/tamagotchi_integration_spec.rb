# frozen_string_literal: true

require 'capybara/rspec'
require './app'
require 'tamagotchi'

Capybara.app = Sinatra::Application
set(show_exception: false)

Capybara.save_path = '~/tmp'

describe('Tamagotchi', type: :feature) do
  before :each do
    Tamagotchi.clear

    @names = %w[Kenny Apple Lifetime]
    @pets = @names.map { |name| { name => Tamagotchi.new(name) } }

    visit '/tamagotchis'
    click_on 'Apple'
    expect(status_code).to eq 200
  end

  it 'sleeps' do
    expect(find('div.sleep')).to have_content '10'
    expect(find('div.activity')).to have_content '10'
    expect(find('div.food')).to have_content '10'
  end

  it 'plays' do
    click_button 'play'
    expect(status_code).to eq 200

    expect(find('div.sleep')).to have_content '9'
    expect(find('div.activity')).to have_content '11'
    expect(find('div.food')).to have_content '9'
  end

  it 'eats' do
    click_button 'eat'
    expect(status_code).to eq 200

    expect(find('div.sleep')).to have_content '9'
    expect(find('div.activity')).to have_content '9'
    expect(find('div.food')).to have_content '11'
  end

  it 'sleeps' do
    click_button 'sleep'
    expect(status_code).to eq 200

    expect(find('div.sleep')).to have_content '11'
    expect(find('div.activity')).to have_content '9'
    expect(find('div.food')).to have_content '9'
  end
end
