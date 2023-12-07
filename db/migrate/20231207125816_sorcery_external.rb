class SorceryExternal < ActiveRecord::Migration[7.0]
  def change
    create_table :authentications do |t|
      t.integer :user_id, null: false
      t.string :provider, :uid, null: false

      t.timestamps              null: false
    end

    add_index :authentications, [:provider, :uid]
    add_index :authentications, :user_id # user_idにindexを貼る場合は追加
  end
end
