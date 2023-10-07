class CreateSteps < ActiveRecord::Migration[7.0]
  def change
    create_table :steps do |t|
      t.references :goal, null: false, foreign_key: true
      t.string :action_1
      t.string :action_2
      t.string :action_3
      t.integer :times_set_1
      t.integer :times_set_2
      t.integer :times_set_3

      t.timestamps
    end
  end
end
