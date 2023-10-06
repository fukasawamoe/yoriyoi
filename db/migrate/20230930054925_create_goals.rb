class CreateGoals < ActiveRecord::Migration[7.0]
  def change
    create_table :goals do |t|
      t.references :user, null: false, foreign_key: true
      t.string :ideal_self_1
      t.string :ideal_self_2
      t.string :ideal_self_3

      t.timestamps
    end
  end
end
