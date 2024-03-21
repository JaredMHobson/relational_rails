class Game < ApplicationRecord
  belongs_to :developer

  def dev_name
    Developer.find(developer_id).name
  end
end
