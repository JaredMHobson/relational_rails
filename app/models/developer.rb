class Developer < ApplicationRecord
  has_many :games

  def game_count
    games.count
  end
end
