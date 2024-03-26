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

  describe '#game_count' do
    it 'can count the number of games it has made' do
      developer1.games.create!({ name: 'Cool Game', year_released: 1999, has_multiplayer: true })

      expect(developer1.game_count).to eq(1)

      developer1.games.create!({ name: 'Another Game', year_released: 2020, has_multiplayer: false })

      expect(developer1.game_count).to eq(2)
    end
  end

  describe '::sort_by_total_games' do
    it 'can sort the developers by total games' do
      developer1.games.create!({ name: 'Cool Game', year_released: 1999, has_multiplayer: true })
      developer1.games.create!({ name: 'Cool Game 2', year_released: 2005, has_multiplayer: false })
      developer2.games.create!({ name: 'Another Game', year_released: 2020, has_multiplayer: false })

      expect(Developer.sort_by_total_games).to eq([developer1, developer2])

      developer2.games.create!({ name: 'Another Game 2', year_released: 2021, has_multiplayer: false })
      developer2.games.create!({ name: 'Another Game 3', year_released: 2022, has_multiplayer: false })

      expect(Developer.sort_by_total_games).to eq([developer2, developer1])
    end
  end
end
