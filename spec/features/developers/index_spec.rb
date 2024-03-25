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
      visit "/developers"

      expect(page).to have_link(href: "/developers/new")
    end

    it 'takes you to page developers/new when you click on the link' do
      visit "/developers"

      click_link(href: "/developers/new")

      expect(page).to have_current_path("/developers/new")
    end
  end

  describe 'User Story 17' do
    it 'has an edit button next to each developer that takes me to the developers edit page' do
      visit "/developers"

      click_button("Edit #{@developer1.name}")

      expect(current_path).to eq("/developers/#{@developer1.id}/edit")

      visit "/developers"

      click_button("Edit #{@developer2.name}")

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
end