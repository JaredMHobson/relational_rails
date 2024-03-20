class CreateGames < ActiveRecord::Migration[7.1]
  def change
    create_table :games do |t|
      t.string :name
      t.integer :year_released
      t.boolean :has_multiplayer

      t.timestamps
    end
  end
end
