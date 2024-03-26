require 'rails_helper'

RSpec.describe 'the developers index page' do
  before :each do
    @developer1 = Developer.create!(name: "Nintendo", is_indie: false, year_founded: 1889)
    @developer2 = Developer.create!(name: "Valve Corporation", is_indie: false, year_founded: 1996)
    @developer3 = Developer.create!(name: "Playtonic Games", is_indie: true, year_founded: 2014)
  end

  describe 'User Story 1' do
    it 'displays all developers names' do
      visit "/developers"

      expect(page).to have_content(@developer1.name)
      expect(page).to have_content(@developer2.name)
      expect(page).to have_content(@developer3.name)
    end
  end

  describe 'User Story 6' do
    it 'orders developers by most recently created first' do
      visit "/developers"

      expect(@developer3.name).to appear_before(@developer2.name)

      expect(@developer2.name).to appear_before(@developer1.name)
    end
  end

  describe 'User Story 11' do
    it 'has a link to create a new developer record' do
      visit '/developers'

      expect(page).to have_link('Add new developer')
    end

    it 'takes you to page developers/new when you click on the link' do
      visit '/developers'

      click_link('Add new developer')

      expect(page).to have_current_path('/developers/new')
    end
  end

  describe 'User Story 17' do
    it 'has an update button next to each developer that takes me to the developers edit page' do
      visit "/developers"

      click_button("Update #{@developer1.name}")

      expect(current_path).to eq("/developers/#{@developer1.id}/edit")

      visit "/developers"

      click_button("Update #{@developer2.name}")

      expect(current_path).to eq("/developers/#{@developer2.id}/edit")
    end
  end

  describe 'User Story 22' do
    it 'has a delete button that returns you to the index page when you click it' do
      visit "/developers/"

      within "#developer_#{@developer1.id}_info" do
        click_button('Delete')
      end

      expect(current_path).to eq('/developers')
    end

    it 'has a delete button next to each developer that deletes the developer' do
      visit "/developers/"

      within "#developer_#{@developer1.id}_info" do
        click_button('Delete')
      end

      expect(page).to_not have_content('Nintendo')
    end
  end

  describe 'Extension 1' do
    it 'has a link that sorts its developers by total games' do
      @developer1.games.create!(name: "VALORANT", has_multiplayer: true, year_released: 2020)
      @developer1.games.create!(name: "League of Legends", has_multiplayer: true, year_released: 2009)
      @developer3.games.create!(name: "Random Game", has_multiplayer: true, year_released: 2009)

      visit "/developers"

      expect(@developer3.name).to appear_before(@developer1.name)

      click_link 'Sort by total games'

      expect(@developer1.name).to appear_before(@developer3.name)
    end

    it 'has a count of each devs total games next to it' do
      @developer1.games.create!(name: "VALORANT", has_multiplayer: true, year_released: 2020)
      @developer1.games.create!(name: "League of Legends", has_multiplayer: true, year_released: 2009)
      @developer3.games.create!(name: "Random Game", has_multiplayer: true, year_released: 2009)

      visit '/developers'

      within "#developer_#{@developer1.id}_info" do
        expect(page).to have_content("Total Games: 2")
      end

      within "#developer_#{@developer3.id}_info" do
        expect(page).to have_content("Total Games: 1")
      end
    end
  end

  describe 'Sort by date created link' do
    it 'has a link that sorts its developers by date created' do
      @developer1.games.create!(name: "VALORANT", has_multiplayer: true, year_released: 2020)

      visit "/developers"
      # Just to mix up the order
      click_link 'Sort by total games'

      expect(@developer1.name).to appear_before(@developer3.name)

      click_link 'Sort by date created'

      expect(@developer3.name).to appear_before(@developer1.name)
    end
  end
end
