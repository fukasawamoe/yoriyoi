class CreateSchedules < ActiveRecord::Migration[7.0]
  def change
    create_table :schedules do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.integer :day_of_week, null: false, array: true, default: []
      t.integer :schedule_count, default: 0

      t.timestamps
    end
  end
end
