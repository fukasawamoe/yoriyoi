class CreateCharacters < ActiveRecord::Migration[7.0]
  def change
    create_table :characters do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.string :personality
      t.string :communication_style
      t.string :relationship
      t.string :additional
      t.string :image

      t.timestamps
    end
  end
end
