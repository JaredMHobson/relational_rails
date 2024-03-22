require 'rails_helper'

RSpec.describe 'the developers show page' do
  before :each do
    @developer1 = Developer.create!(name: "Nintendo", is_indie: false, year_founded: 1889)
    @developer2 = Developer.create!(name: "Valve Corporation", is_indie: false, year_founded: 1996)
  end

  it 'displays the name of the developer' do
    visit "/developers/#{@developer1.id}"

    expect(page).to have_content(@developer1.name)

    visit "/developers/#{@developer2.id}"

    expect(page).to have_content(@developer2.name)
  end

  describe 'User Story 7' do
    it 'display a count of the number of games made by the developer' do
      @mario = @developer1.games.create!(name: "Super Mario Galaxy", has_multiplayer: false, year_released: 2050)
      @zelda = @developer1.games.create!(name: "Twilight Princess", has_multiplayer: false, year_released: 1999)
      @tf2 = @developer2.games.create!(name: "Team Fortress 2", has_multiplayer: true, year_released: 2009)

      visit "/developers/#{@developer1.id}"

      expect(page).to have_content("Total Games: #{@developer1.game_count}")

      visit "/developers/#{@developer2.id}"

      expect(page).to have_content("Total Games: #{@developer2.game_count}")
    end
  end
end