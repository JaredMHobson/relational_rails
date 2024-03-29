require 'rails_helper'

RSpec.describe 'the developers games page' do
  before :each do
    @riot = Developer.create!(name: "Riot Games", is_indie: false, year_founded: 2006)
    @valorant = @riot.games.create!(name: "VALORANT", has_multiplayer: true, year_released: 2020)
    @league = @riot.games.create!(name: "League of Legends", has_multiplayer: true, year_released: 2009)
    @remedy = Developer.create!(name: "Remedy Entertainment", is_indie: false, year_founded: 1995)
    @control = @remedy.games.create!(name: "Control", has_multiplayer: false, year_released: 2019)
  end

  it 'displays the name of the games it developed' do
    visit "/developers/#{@riot.id}/games"

    expect(page).to have_content("#{@valorant.name}")
    expect(page).to have_content("#{@league.name}")

    visit "/developers/#{@remedy.id}/games"

    expect(page).to have_content("#{@control.name}")
  end

  it 'displays if the games it developed have multiplayer' do
    visit "/developers/#{@riot.id}/games"

    expect(page).to have_content("Multiplayer: #{@valorant.has_multiplayer}")
    expect(page).to have_content("Multiplayer: #{@league.has_multiplayer}")

    visit "/developers/#{@remedy.id}/games"

    expect(page).to have_content("Multiplayer: #{@control.has_multiplayer}")
  end

  it 'displays the year the games the games it developed were released' do
    visit "/developers/#{@riot.id}/games"

    expect(page).to have_content("Year Released: #{@valorant.year_released}")
    expect(page).to have_content("Year Released: #{@league.year_released}")

    visit "/developers/#{@remedy.id}/games"

    expect(page).to have_content("Year Released: #{@control.year_released}")
  end

  it 'does not display games it did not develop' do
    visit "/developers/#{@riot.id}/games"

    expect(page).to_not have_content("#{@control.name}")
    expect(page).to_not have_content("Multiplayer: #{@control.has_multiplayer}")
    expect(page).to_not have_content("Year Released: #{@control.year_released}")
    expect(page).to_not have_content("Developer: #{@control.dev_name}")
  end

  describe 'User Story 13' do
    it 'has a link to add a game to its games' do
      visit "/developers/#{@riot.id}/games"

      expect(page).to have_link("Add Game")
    end

    it 'takes you to /developers/#{@riot.id}/games/new when you click the Add Game link' do
      visit "/developers/#{@riot.id}/games"

      click_link 'Add Game'

      expect(current_path).to eq("/developers/#{@riot.id}/games/new")
    end
  end

  describe 'User Story 16' do
    it 'has a link that sorts its games alphabetically' do
      visit "/developers/#{@riot.id}/games"

      expect(@valorant.name).to appear_before(@league.name)

      click_link 'Sort Alphabetically'

      expect(@league.name).to appear_before(@valorant.name)
    end
  end

  describe 'User Story 21' do
    it 'has a form on it that only returns games that belong to the developer that were released after a certain year' do
      visit "/developers/#{@riot.id}/games"

      fill_in(:games_after_year, with: '2010')
      click_button('Submit')

      expect(page).to_not have_content('League of Legends')
    end
  end

  describe 'Update Button' do
    it 'has an update button next to each game that takes me to the games edit page' do
      visit "/developers/#{@riot.id}/games"

      click_button("Update #{@valorant.name}")

      expect(current_path).to eq("/games/#{@valorant.id}/edit")

      visit "/developers/#{@riot.id}/games"

      click_button("Update #{@league.name}")

      expect(current_path).to eq("/games/#{@league.id}/edit")
    end
  end

  describe 'Delete Button' do
    it 'has a delete button that returns you to the games index page when you click it' do
      visit "/developers/#{@riot.id}/games"

      within "#game_#{@valorant.id}_info" do
        click_button('Delete')
      end

      expect(current_path).to eq('/games')
    end

    it 'has a delete button next to each game that deletes the game' do
      visit "/developers/#{@riot.id}/games"

      within "#game_#{@valorant.id}_info" do
        click_button('Delete')
      end

      expect(page).to_not have_content('Valorant')
    end
  end
end