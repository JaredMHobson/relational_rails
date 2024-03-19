class CreateDeveloper < ActiveRecord::Migration[7.1]
  def change
    create_table :developers do |t|
      t.string :name
      t.boolean :is_indie
      t.integer :year_founded

      t.timestamps
    end
  end
end
