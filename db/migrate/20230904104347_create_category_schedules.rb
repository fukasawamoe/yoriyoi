class CreateCategorySchedules < ActiveRecord::Migration[7.0]
  def change
    create_table :category_schedules do |t|
      t.references :category, null: false, foreign_key: true
      t.references :schedule, null: false, foreign_key: true

      t.timestamps
    end
  end
end
