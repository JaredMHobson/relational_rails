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
        expect(page).to have_link(href: '/games')
      end
    end
  end

  describe 'User Story 9' do
    it 'has a link to the developer index' do
      visit '/'

      within 'nav' do
        expect(page).to have_link(href: '/developers')
      end
    end
  end
end
