require 'rails_helper'

RSpec.describe 'the developers show page' do
  before :each do
    @developer1 = Developer.create!(name: "Nintendo", is_indie: false, year_founded: 1889)
    @developer2 = Developer.create!(name: "Valve Corporation", is_indie: false, year_founded: 1996)
  end

  it 'displays the name of the developer' do
    visit "/developers/#{@developer1.id}"

    expect(page).to have_content(@developer1.name)

    visit "/developers/#{@developer2.id}"

    expect(page).to have_content(@developer2.name)
  end
end