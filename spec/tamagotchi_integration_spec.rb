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
  end

  it 'sleeps' do
    # we seletct tamagotchi and do nothing
    2.times do
      visit '/tamagotchis'
      click_on 'Apple'
      expect(status_code).to eq 200
    end
    # level of sleep increases
    expect(find('div.sleep')).to have_content '10'
    # level of activity decrease
    expect(find('div.activity')).to have_content '10'
    # level of food decrease
    expect(find('div.food')).to have_content '10'
  end

  it 'plays' do
    # level of activity increase
    # level of sleep decrease
    # level of food decreas
  end

  it 'eats' do
    # level of food increase
    # level of sleep decrease
    # level of activity decrease
  end
end
