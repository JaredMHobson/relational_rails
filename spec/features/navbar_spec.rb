require 'rails_helper'

RSpec.describe 'the navbar' do
  it 'display the navbar on all pages' do
    visit '/'

    expect(page).to have_selector('nav')

    visit '/developers'

    expect(page).to have_selector('nav')
  end

  describe 'User Story 8' do
    it 'has a link to the games index' do
      visit '/'

      within 'nav' do
        expect(page).to have_link('Game Index')

        click_link('Game Index')
      end

      expect(page).to have_current_path('/games')
    end
  end

  describe 'User Story 9' do
    it 'has a link to the developer index' do
      visit '/'

      within 'nav' do
        expect(page).to have_link('Developer Index')

        click_link('Developer Index')
      end

      expect(page).to have_current_path('/developers')
    end
  end
end
