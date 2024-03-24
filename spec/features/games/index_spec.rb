require 'rails_helper'

RSpec.describe 'the games index page' do
  before :each do
    @riot = Developer.create!(name: "Riot Games", is_indie: false, year_founded: 2006)
    @valorant = @riot.games.create!(name: "VALORANT", has_multiplayer: true, year_released: 2020)
    @league = @riot.games.create!(name: "League of Legends", has_multiplayer: true, year_released: 2009)
    @remedy = Developer.create!(name: "Remedy Entertainment", is_indie: false, year_founded: 1995)
    @control = @remedy.games.create!(name: "Control", has_multiplayer: false, year_released: 2019)
  end

  it 'displays all games names' do
    visit "/games"

    within "#game_#{@valorant.id}_info" do
      expect(page).to have_content(@valorant.name)
    end

    within "#game_#{@league.id}_info" do
      expect(page).to have_content(@league.name)
    end
  end

  it 'displays if each game has multiplayer' do
    visit "/games"

    within "#game_#{@valorant.id}_info" do
      expect(page).to have_content("Multiplayer: true")
    end

    # within "#game_#{@control.id}_info" do
    #   expect(page).to have_content("Multiplayer: false")
    # end
  end

  it 'displays the year each game was released' do
    visit "/games"

    within "#game_#{@valorant.id}_info" do
      expect(page).to have_content("Released: 2020")
    end

    # within "#game_#{@control.id}_info" do
    #   expect(page).to have_content("Released: 2019")
    # end
  end

  it 'display the developers name of each game' do
    visit "/games"

    within "#game_#{@valorant.id}_info" do
      expect(page).to have_content("Developer: Riot Games")
    end

    # within "#game_#{@control.id}_info" do
    #   expect(page).to have_content("Developer: Remedy Entertainment")
    # end
  end

  describe 'User Story 15' do
    it 'only shows games that have multiplayer' do
      visit '/games'

      expect(page).to have_content('Multiplayer: true')
      expect(page).to_not have_content('Multiplayer: false')
    end
  end

  describe 'User Story 18' do
    it 'has an edit link next to each game that takes me to the games edit page' do
      visit "/games"

      click_link("Edit #{@valorant.name}")

      expect(current_path).to eq("/games/#{@valorant.id}/edit")

      visit "/games"

      click_link("Edit #{@league.name}")

      expect(current_path).to eq("/games/#{@league.id}/edit")
    end
  end
end