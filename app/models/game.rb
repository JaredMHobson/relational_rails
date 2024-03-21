class Game < ApplicationRecord
  belongs_to :developer

  def dev_name
    developer.name
  end
end
