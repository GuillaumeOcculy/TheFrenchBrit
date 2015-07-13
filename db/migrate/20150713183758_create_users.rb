class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :firstname
      t.string :lastname
      t.string :email
      t.boolean :is_admin, default: false
      t.string :password_digest
      t.string :password_token
    end
    add_index :users, :email
  end
end
