class Developer < ApplicationRecord
  has_many :games

  def game_count
    self.games.count
  end
end
