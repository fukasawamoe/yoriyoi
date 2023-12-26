class SorceryCore < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name,             null: false
      t.string :email
      t.string :crypted_password
      t.string :salt
      t.boolean :first_login, default: true

      t.timestamps                null: false
    end
  end
end
