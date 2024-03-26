class Developer < ApplicationRecord
  has_many :games

  def game_count
    games.count
  end

  def self.sort_by_total_games
    all.sort_by do |dev|
      dev.game_count
    end.reverse
  end
end
