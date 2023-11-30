class CreateAchievements < ActiveRecord::Migration[7.0]
  def change
    create_table :achievements do |t|
      t.references :user, null: false, foreign_key: true
      t.references :step, null: false, foreign_key: true
      t.integer :day_check, array: true, default: []
      t.integer :times_completed
      t.date :completed_date

      t.timestamps
    end
  end
end
