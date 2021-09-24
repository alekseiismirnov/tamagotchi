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

  context 'there are some' do
    before :all do
      Tamagotchi.clear
      @names = %w[Nobody Whatever Noway]
      @tamagotchis = @names.map { |name| Tamagotchi.new(name) }
      visit '/tamagotchis'
    end

    it 'there are names in list' do
      within('.tamagotchis_list') do
        names_from_view = all('div', class: 'tamagotchi').map(&:text)

        expect(names_from_view).to match_array @names
      end
    end
  end
end
