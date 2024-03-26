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

    it 'can create a new developer' do
      visit '/developers/new'

      fill_in(:name, with: 'ArenaNet')
      fill_in(:year_founded, with: 2001)
      check(:is_indie)
      click_button('Add Developer')

      new_developer_name = Developer.last.name

      expect(new_developer_name).to eq('ArenaNet')
    end

    it 'redirects me to Developers index when I click the add developer button' do
      visit '/developers/new'

      fill_in(:name, with: 'Psyonix')
      fill_in(:year_founded, with: 2000)
      click_button('Add Developer')

      expect(current_path).to eq('/developers')
    end

    it 'shows the new developer on the index page when added' do
      visit '/developers/new'

      fill_in(:name, with: 'Jagex')
      fill_in(:year_founded, with: 1990)
      click_button('Add Developer')

      expect(page).to have_content('Jagex')
    end
  end
end
