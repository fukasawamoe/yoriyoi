class CreateSchedules < ActiveRecord::Migration[7.0]
  def change
    create_table :schedules do |t|
      t.time :schedule_time
      t.string :task
      t.text :memo
      t.boolean :goal_select

      t.timestamps
    end
  end
end
