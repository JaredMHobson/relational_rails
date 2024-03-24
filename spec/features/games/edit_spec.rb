require 'rails_helper'

RSpec.describe 'the games edit page' do
  before :each do
    @riot = Developer.create!(name: "Riot Games", is_indie: false, year_founded: 2006)
    @valorant = @riot.games.create!(name: "VALORANT", has_multiplayer: true, year_released: 2020)
    @league = @riot.games.create!(name: "League of Legends", has_multiplayer: true, year_released: 2009)
    @remedy = Developer.create!(name: "Remedy Entertainment", is_indie: false, year_founded: 1995)
    @control = @remedy.games.create!(name: "Control", has_multiplayer: false, year_released: 2019)
  end

  describe 'User Story 14' do
    it 'has a form when I visit a games edit page' do
      visit "/games/#{@valorant.id}/edit"

      expect(page).to have_selector('form')
    end

    it 'takes me to the games show page when I click the Update Game button' do
      visit "/games/#{@valorant.id}/edit"

      fill_in(:name, with: 'Pokemon Red')
      fill_in(:year_released, with: 1995)
      uncheck(:has_multiplayer)
      click_button("Update #{@valorant.name}")

      expect(current_path).to eq("/games/#{@valorant.id}")
    end

    it 'updates the games show page with the new info' do
      visit "/games/#{@valorant.id}/edit"

      fill_in(:name, with: 'Pokemon Red')
      fill_in(:year_released, with: 1995)
      uncheck(:has_multiplayer)
      click_button("Update #{@valorant.name}")

      expect(page).to have_content("Pokemon Red")
      expect(page).to have_content("Year Released: 1995")
    end
  end
end