require 'rails_helper'

RSpec.describe Game do
  let (:game1) { Game.new({ id: 1, name: 'Cool Game', year_released: 1999, has_multiplayer: true, developer_id: 1 }) }
  let (:game2) { Game.new({ id: 2, name: 'Another Game', year_released: 2020, has_multiplayer: false, developer_id: 1 }) }

  describe '#initialize' do
    it 'exists' do
      expect(game1).to be_a(Game)
    end

    it 'has an id' do
      expect(game1.id).to eq(1)
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
      expect(game1.developer_id).to eq(1)
    end
  end
end