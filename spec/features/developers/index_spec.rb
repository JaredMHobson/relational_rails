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
end