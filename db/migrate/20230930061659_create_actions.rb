class CreateActions < ActiveRecord::Migration[7.0]
  def change
    create_table :actions do |t|
      t.references :goal, null: false, foreign_key: true
      t.string :content
      t.integer :times_set

      t.timestamps
    end
  end
end
