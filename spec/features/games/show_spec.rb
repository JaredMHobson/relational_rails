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

    expect(page).to have_content("#{@valorant.name}")

    visit "/games/#{@control.id}"

    expect(page).to have_content("#{@control.name}")
  end

  it 'displays if the game has multiplayer' do
    visit "/games/#{@valorant.id}"

    expect(page).to have_content("Multiplayer: #{@valorant.has_multiplayer}")

    visit "/games/#{@control.id}"

    expect(page).to have_content("Multiplayer: #{@control.has_multiplayer}")
  end

  it 'displays the year the game was released' do
    visit "/games/#{@valorant.id}"

    expect(page).to have_content("Year Released: #{@valorant.year_released}")

    visit "/games/#{@control.id}"

    expect(page).to have_content("Year Released: #{@control.year_released}")
  end

  it 'displays the name of the games developer' do
    visit "/games/#{@valorant.id}"

    expect(page).to have_content("Developer: #{@valorant.dev_name}")

    visit "/games/#{@control.id}"

    expect(page).to have_content("Developer: #{@control.dev_name}")
  end

  it 'does not display other games info' do
    visit "/games/#{@valorant.id}"

    expect(page).to_not have_content("#{@control.name}")
    expect(page).to_not have_content("Multiplayer: #{@control.has_multiplayer}")
    expect(page).to_not have_content("Year Released: #{@control.year_released}")
    expect(page).to_not have_content("Developer: #{@control.dev_name}")
  end

  describe 'User Story 14' do
    it 'has a link to the edit page when I visit a games show page' do
      visit "/games/#{@control.id}"

      expect(page).to have_button("Update #{@control.name}")
    end

    it 'takes me to the game edit page when I click the update button' do
      visit "/games/#{@control.id}"

      click_button("Update #{@control.name}")

      expect(current_path).to eq("/games/#{@control.id}/edit")
    end
  end

  describe 'User Story 20' do
    it 'has a delete button that redirects you to the games index page' do
      visit "/games/#{@valorant.id}"
      
      click_button('Delete')

      expect(current_path).to eq('/games')
    end

    it 'has a delete button that deletes the game' do
      visit "/games/#{@valorant.id}"
      
      click_button('Delete')

      expect(page).to_not have_content('Valorant')
    end
  end
end