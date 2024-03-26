require 'rails_helper'

RSpec.describe Developer do
  let (:developer1) { Developer.create!({ id: 1, name: 'Cool Dev', year_founded: 1992, is_indie: true}) }
  let (:developer2) { Developer.create!({ id: 2, name: 'Another Dev', year_founded: 2000, is_indie: false}) }

  describe 'associations' do
    it { should have_many :games }
  end

  describe '#initialize' do
    it 'exists' do
      expect(developer1).to be_a(Developer)
    end

    it 'has an id' do
      expect(developer1.id).to eq(1)
    end

    it 'has a name' do
      expect(developer1.name).to eq('Cool Dev')
    end

    it 'has a year_founded' do
      expect(developer1.year_founded).to eq(1992)
    end

    it 'can be indie' do
      expect(developer1.is_indie).to eq(true)
      expect(developer2.is_indie).to eq(false)
    end
  end
end