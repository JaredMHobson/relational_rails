require 'rails_helper'

RSpec.describe 'the developers show page' do
  before :each do
    @developer1 = Developer.create!(name: "Nintendo", is_indie: false, year_founded: 1889)
    @developer2 = Developer.create!(name: "Valve Corporation", is_indie: false, year_founded: 1996)
  end

  describe 'User Story 2' do
    it 'displays the name of the developer' do
      visit "/developers/#{@developer1.id}"

      expect(page).to have_content(@developer1.name)

      visit "/developers/#{@developer2.id}"

      expect(page).to have_content(@developer2.name)
    end

    it 'displays if the developer is indie' do
      visit "/developers/#{@developer1.id}"

      expect(page).to have_content("Indie: #{@developer1.is_indie}")

      visit "/developers/#{@developer2.id}"

      expect(page).to have_content("Indie: #{@developer2.is_indie}")
    end

    it 'displays the year it was founded' do
      visit "/developers/#{@developer1.id}"

      expect(page).to have_content("Year Founded: #{@developer1.year_founded}")

      visit "/developers/#{@developer2.id}"

      expect(page).to have_content("Year Founded: #{@developer2.year_founded}")
    end
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

  describe 'User Story 10' do
    it 'displays a link to a list of its own games at /developers/:id/games' do
      visit "/developers/#{@developer1.id}"

      expect(page).to have_link(href: "/developers/#{@developer1.id}/games")
    end
  end

  describe 'User Story 12' do
    it 'has a link to the edit page when I visit a developers show page' do
      visit "/developers/#{@developer1.id}"

      expect(page).to have_button("Update #{@developer1.name}")
    end

    it 'takes me to the developer edit page when I click the update link' do
      visit "/developers/#{@developer1.id}"

      click_button("Update #{@developer1.name}")

      expect(current_path).to eq("/developers/#{@developer1.id}/edit")
    end
  end

  describe 'User Story 19' do
    it 'has a delete button that redirects you to the index page' do
      visit "/developers/#{@developer1.id}"
      
      click_button('Delete')

      expect(current_path).to eq('/developers')
    end

    it 'has a delete button that deletes the developer' do
      visit "/developers/#{@developer1.id}"
      
      click_button('Delete')

      expect(page).to_not have_content('Nintendo')
    end

    it 'has a delete button that deletes the developers games' do
      @developer1.games.create!(name: 'Mario', year_released: 1985, has_multiplayer: true)
      @developer1.games.create!(name: 'Zelda', year_released: 2000, has_multiplayer: true)

      visit "/developers/#{@developer1.id}"
      
      click_button('Delete')

      visit '/games'

      expect(page).to_not have_content('Mario')
      expect(page).to_not have_content('Zelda')
    end
  end
end