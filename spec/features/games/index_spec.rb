require 'rails_helper'

RSpec.describe 'the developers index page' do
  before :each do
    @riot = Developer.create!(name: "Riot Games", is_indie: false, year_founded: 2006)
    @valorant = @riot.games.create!(name: "VALORANT", has_multiplayer: true, year_released: 2020)
    @league = @riot.games.create!(name: "League of Legends", has_multiplayer: true, year_released: 2009)
    @remedy = Developer.create!(name: "Remedy Entertainment", is_indie: false, year_founded: 1995)
    @control = @remedy.games.create!(name: "Control", has_multiplayer: false, year_released: 2019)
  end

  it 'displays all games names' do
    visit "/games"

    expect(page).to have_content(@valorant.name)
    expect(page).to have_content(@league.name)
  end

  it 'displays if each game has multiplayer' do
    visit "/games"

    expect(page).to have_content("Multiplayer: true")
    expect(page).to have_content("Multiplayer: false")
  end

  it 'displays the year each game was released' do
    visit "/games"

    expect(page).to have_content("Released: 2020")
    expect(page).to have_content("Released: 2019")
  end

  it 'display the developers name of each game' do
    visit "/games"

    expect(page).to have_content("Developer: Riot Games")
    expect(page).to have_content("Developer: Remedy Entertainment")
  end
end