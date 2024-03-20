require 'rails_helper'

RSpec.describe 'the developers index page' do
  it 'displays all developers' do
    developer1 = Developer.create!(name: "Nintendo", is_indie: false, year_founded: 1889)
    developer2 = Developer.create!(name: "Valve Corporation", is_indie: false, year_founded: 1996)
    developer3 = Developer.create!(name: "Playtonic Games", is_indie: true, year_founded: 2014)

    visit "/developers"

    expect(page).to have_content(developer1.name)
    expect(page).to have_content(developer2.name)
    expect(page).to have_content(developer3.name)
  end
end