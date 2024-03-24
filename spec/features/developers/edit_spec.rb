require 'rails_helper'

RSpec.describe 'the developers edit page' do
  before :each do
    @developer1 = Developer.create!(name: "Nintendo", is_indie: false, year_founded: 1889)
    @developer2 = Developer.create!(name: "Valve Corporation", is_indie: false, year_founded: 1996)
  end

  describe 'User Story 12' do
    it 'has a link to the edit page when I visit a developers show page' do
      visit "/developers/#{@developer1.id}"

      expect(page).to have_link("/developers/#{@developer1}/edit")
    end

    it 'takes me to the developer edit page when I click the edit link' do
      visit "/developers/#{@developer1.id}"

      click_link("Edit #{@developer1.name}")

      expect(current_path).to eq("/developers/#{@developer1.id}/edit")
    end
  end
end