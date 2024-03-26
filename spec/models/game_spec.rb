require 'rails_helper'

RSpec.describe Game do
  before :each do
    @developer1 = Developer.create!(name: 'Cool Dev', year_founded: 1992, is_indie: true)
    @developer2 = Developer.create!(name: 'Another Dev', year_founded: 2000, is_indie: false)
    @game1 = @developer1.games.create!(name: 'Cool Game', year_released: 1999, has_multiplayer: true)
    @game2 = @developer2.games.create!(name: 'Another Game', year_released: 2020, has_multiplayer: false)
  end

  describe 'associations' do
    it {should belong_to :developer}
  end

  describe '#initialize' do
    it 'exists' do
      expect(@game1).to be_a(Game)
    end

    it 'has an id' do
      expect(@game1.id).to_not eq(nil)
    end

    it 'has a name' do
      expect(@game1.name).to eq('Cool Game')
    end

    it 'has a year_released' do
      expect(@game1.year_released).to eq(1999)
    end

    it 'can have multiplayer' do
      expect(@game1.has_multiplayer).to eq(true)
      expect(@game2.has_multiplayer).to eq(false)
    end

    it 'has a developer id' do
      expect(@game1.developer_id).to eq(@developer1.id)
    end
  end

  describe '#dev_name' do
    it 'can return its developers name' do
      game_developer = @game1.dev_name

      expect(game_developer).to eq('Cool Dev')
    end
  end

  describe '::sort_games_by_name' do
    it 'will sort all alphabetically by name' do
      @game3 = @developer2.games.create!({ name: 'The Third Game', year_released: 2021, has_multiplayer: true })

      abc_games = Game.sort_games_by_name

      expect(abc_games).to eq([@game2, @game1, @game3])
    end
  end

  describe '::show_games_released_after' do
    it 'will only show games released after the argument year' do
      @game3 = @developer2.games.create!({ name: 'The Third Game', year_released: 2021, has_multiplayer: true })

      modern_games = Game.show_games_released_after(2019)

      expect(modern_games).to eq([@game2, @game3])
    end
  end
end