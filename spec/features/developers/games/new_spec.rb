require 'rails_helper'

RSpec.describe 'the developers new page' do
  before :each do
    @riot = Developer.create!(name: "Riot Games", is_indie: false, year_founded: 2006)
    @valorant = @riot.games.create!(name: "VALORANT", has_multiplayer: true, year_released: 2020)
    @league = @riot.games.create!(name: "League of Legends", has_multiplayer: true, year_released: 2009)
    @remedy = Developer.create!(name: "Remedy Entertainment", is_indie: false, year_founded: 1995)
    @control = @remedy.games.create!(name: "Control", has_multiplayer: false, year_released: 2019)
  end

  describe 'User Story 13' do
    it 'has a form for creating a new game for that specific developer' do
      visit "/developers/#{@riot.id}/games/new"

      expect(page).to have_selector("form")
    end

    it 'can create a new game' do
      visit "/developers/#{@riot.id}/games/new"

      fill_in(:name, with: '2XKO')
      fill_in(:year_released, with: 2025)
      check(:has_multiplayer)
      click_button('Create Game')

      new_game_name = Game.last.name

      expect(new_game_name).to eq('2XKO')
    end

    it 'creates a new game that belongs to that specific developer' do
      visit "/developers/#{@riot.id}/games/new"

      fill_in(:name, with: '2XKO')
      fill_in(:year_released, with: 2025)
      check(:has_multiplayer)
      click_button('Create Game')

      new_game_dev = Game.last.dev_name

      expect(new_game_dev).to eq(@riot.name)
    end

    it 'redirects me to the developers games page when I click the Create Game button' do
      visit "/developers/#{@riot.id}/games/new"

      fill_in(:name, with: '2XKO')
      fill_in(:year_released, with: 2025)
      check(:has_multiplayer)
      click_button('Create Game')

      expect(current_path).to eq("/developers/#{@riot.id}/games")
    end

    it 'shows the new game on the developers games page when created' do
      visit "/developers/#{@riot.id}/games/new"

      fill_in(:name, with: '2XKO')
      fill_in(:year_released, with: 2025)
      check(:has_multiplayer)
      click_button('Create Game')

      expect(page).to have_content('2XKO')
      expect(page).to have_content('Year Released: 2025')
    end
  end
end