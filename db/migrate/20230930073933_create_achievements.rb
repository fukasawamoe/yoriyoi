class CreateAchievements < ActiveRecord::Migration[7.0]
  def change
    create_table :achievements do |t|
      t.references :step, null: false, foreign_key: true
      t.integer :day_check, array: true, default: []

      t.timestamps
    end
  end
end
