class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|
      t.references :schedule, null: false, foreign_key: true
      t.datetime :task_time
      t.string :to_do
      t.text :memo
      t.boolean :goal_select, default: false

      t.timestamps
    end
  end
end
