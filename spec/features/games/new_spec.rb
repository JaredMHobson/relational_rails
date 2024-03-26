require 'rails_helper'

RSpec.describe 'the games new page' do
  before :each do
    @riot = Developer.create!(name: "Riot Games", is_indie: false, year_founded: 2006)
    @valorant = @riot.games.create!(name: "VALORANT", has_multiplayer: true, year_released: 2020)
    @league = @riot.games.create!(name: "League of Legends", has_multiplayer: true, year_released: 2009)
    @remedy = Developer.create!(name: "Remedy Entertainment", is_indie: false, year_founded: 1995)
    @control = @remedy.games.create!(name: "Control", has_multiplayer: false, year_released: 2019)
  end

  describe 'Creating a new game' do
    it 'has a form for creating a new game' do
      visit "/games/new"

      expect(page).to have_selector("form")
    end

    it 'can create a new game' do
      visit '/games/new'

      fill_in(:name, with: '2XKO')
      fill_in(:year_released, with: 2025)
      check(:has_multiplayer)
      click_button('Add Game')

      new_game_name = Game.last.name

      expect(new_game_name).to eq('2XKO')
    end

    it 'redirects me to games index when I click the add game button' do
      visit '/games/new'

      fill_in(:name, with: 'Call of Duty Modern Advanced Warfare 29 Remake Edition')
      fill_in(:year_released, with: 2111)
      click_button('Add Game')

      expect(current_path).to eq('/games')
    end

    it 'shows the new game on the index page when added' do
      visit '/games/new'

      fill_in(:name, with: 'Skyrim Toaster Edition')
      fill_in(:year_released, with: 2030)
      check(:has_multiplayer)
      click_button('Add Game')

      expect(page).to have_content('Skyrim Toaster Edition')
    end
  end
end