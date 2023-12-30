class CreateAchievements < ActiveRecord::Migration[7.0]
  def change
    create_table :achievements do |t|
      t.references :step, null: false, foreign_key: true
      t.boolean :check, default: false, null: false
      t.date :daily, null: false

      t.timestamps
    end
  end
end
