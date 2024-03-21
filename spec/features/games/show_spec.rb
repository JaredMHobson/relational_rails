require 'rails_helper'

RSpec.describe 'the games show page' do
  before :each do
    @riot = Developer.create!(name: "Riot Games", is_indie: false, year_founded: 2006)
    @valorant = @riot.games.create!(name: "VALORANT", has_multiplayer: true, year_released: 2020)
    @league = @riot.games.create!(name: "League of Legends", has_multiplayer: true, year_released: 2009)
    @remedy = Developer.create!(name: "Remedy Entertainment", is_indie: false, year_founded: 1995)
    @control = @remedy.games.create!(name: "Control", has_multiplayer: false, year_released: 2019)
  end

  it 'displays the name of the game' do
    visit "/games/#{@valorant.id}"

    expect(page).to have_content(@valorant.name)

    visit "/games/#{@control.id}"

    expect(page).to have_content(@control.name)
  end
end