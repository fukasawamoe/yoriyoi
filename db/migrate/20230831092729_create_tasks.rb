class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|
      t.references :category, null: false, foreign_key: true
      t.time :task_time
      t.string :to_do
      t.text :memo
      t.boolean :goal_select

      t.timestamps
    end
  end
end
