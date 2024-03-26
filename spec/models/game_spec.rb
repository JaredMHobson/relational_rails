require 'rails_helper'

RSpec.describe Game do
  let (:developer1) { Developer.create!({ name: 'Cool Dev', year_founded: 1992, is_indie: true}) }
  let (:developer2) { Developer.create!({ name: 'Another Dev', year_founded: 2000, is_indie: false}) }
  let (:game1) { developer1.games.create!({ name: 'Cool Game', year_released: 1999, has_multiplayer: true }) }
  let (:game2) { developer2.games.create!({ name: 'Another Game', year_released: 2020, has_multiplayer: false }) }

  describe '#initialize' do
    it 'exists' do
      expect(game1).to be_a(Game)
    end

    it 'has an id' do
      expect(game1.id).to_not eq(nil)
    end

    it 'has a name' do
      expect(game1.name).to eq('Cool Game')
    end

    it 'has a year_released' do
      expect(game1.year_released).to eq(1999)
    end

    it 'can have multiplayer' do
      expect(game1.has_multiplayer).to eq(true)
      expect(game2.has_multiplayer).to eq(false)
    end

    it 'has a developer id' do
      expect(game1.developer_id).to eq(developer1.id)
    end
  end

  describe '#dev_name' do
    it 'can return its developers name' do
      game_developer = game1.dev_name

      expect(game_developer).to eq('Cool Dev')
    end
  end
end