# frozen_string_literal: true

require 'capybara/rspec'
require './app'
require 'tamagotchi'

Capybara.app = Sinatra::Application
set(show_exception: false)

Capybara.save_path = '~/tmp'

describe('Tamagotchis list', type: :feature) do
  context 'if there is no one' do
    it 'displays `nobody here` sight' do
      Tamagotchi.clear
      visit '/tamagotchis'

      within('.tamagotchis_list') do
        expect(page).to have_content 'There is no tamagotchi here' 
      end
    end
  end
end
