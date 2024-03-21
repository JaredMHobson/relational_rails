require 'rails_helper'

RSpec.describe 'the developers index page' do
  before :each do
    @riot = Developer.create!(name: "Riot Games", is_indie: false, year_founded: 2006)
    @valorant = @riot.games.create!(name: "VALORANT", has_multiplayer: true, year_released: 2020)
    @league = @riot.games.create!(name: "League of Legends", has_multiplayer: true, year_released: 2009)
  end

  it 'displays all games names' do
    visit "/games"

    expect(page).to have_content(@valorant.name)
    expect(page).to have_content(@league.name)
  end
end