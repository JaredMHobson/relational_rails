class Game < ApplicationRecord
  belongs_to :developer

  def dev_name
    developer.name
  end

  def self.sort_games_by_name
    order(:name)
  end

  def self.show_games_released_after(year)
    where("year_released >= #{year}")
  end
end
