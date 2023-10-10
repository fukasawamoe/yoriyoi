class CreateAchievements < ActiveRecord::Migration[7.0]
  def change
    create_table :achievements do |t|
      t.references :step, null: false, foreign_key: true
      t.boolean :completed
      t.integer :day_of_week
      t.integer :week_number
      t.integer :times_completed
      t.date :completed_date

      t.timestamps
    end
  end
end
