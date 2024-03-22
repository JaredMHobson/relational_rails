require 'rails_helper'

RSpec.describe 'the developers new page' do
  before :each do
    @developer1 = Developer.create!(name: "Nintendo", is_indie: false, year_founded: 1889)
    @developer2 = Developer.create!(name: "Valve Corporation", is_indie: false, year_founded: 1996)
    @developer3 = Developer.create!(name: "Playtonic Games", is_indie: true, year_founded: 2014)
  end

  describe 'User Story 11' do
    it 'has a form for creating a new developer' do
      visit "/developers/new"

      expect(page).to have_selector("form")
    end
  end
end