class Game < ApplicationRecord
  def dev_name
    Developer.find(developer_id).name
  end
end
