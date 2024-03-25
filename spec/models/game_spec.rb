require 'rails_helper'

RSpec.describe Game do
  let (:game) { Game.new({ name: 'Cool Game', year_released: 1999, has_multiplayer: true, developer_id: 1 }) }

  describe '#initialize' do
    it 'exists' do
      expect(game).to be_a(Game)
    end

    it 'has a name' do
      expect(game.name).to eq('Cool Game')
    end

    it 'has a year_released' do
      expect(game.year_released).to eq(1999)
    end

    it 'can have multiplayer' do
      expect(game.has_multiplayer).to eq(true)
    end

    it 'has a developer id' do
      expect(game.developer_id).to eq(1)
    end
  end
end