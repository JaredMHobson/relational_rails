require 'rails_helper'

RSpec.describe 'the developers edit page' do
  before :each do
    @developer1 = Developer.create!(name: "Nintendo", is_indie: false, year_founded: 1889)
    @developer2 = Developer.create!(name: "Valve Corporation", is_indie: false, year_founded: 1996)
  end

  describe 'User Story 12' do
    it 'has a form when I visit a developers edit page' do
      visit "/developers/#{@developer1.id}/edit"

      expect(page).to have_selector('form')
    end

    it 'takes me to the developers show page when I click the Update Developer button' do
      visit "/developers/#{@developer1.id}/edit"

      fill_in(:name, with: 'Sony')
      fill_in(:year_founded, with: 1876)
      check(:is_indie)
      click_button("Update #{@developer1.name}")

      expect(current_path).to eq("/developers/#{@developer1.id}")
    end

    it 'updates the developer show page with the new info' do
      visit "/developers/#{@developer2.id}/edit"

      fill_in(:name, with: 'GameFreak')
      fill_in(:year_founded, with: 1900)
      click_button("Update #{@developer2.name}")

      expect(page).to have_content("GameFreak")
      expect(page).to have_content("Year Founded: 1900")
    end
  end
end
