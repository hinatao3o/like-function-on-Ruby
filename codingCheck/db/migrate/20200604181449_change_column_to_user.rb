class ChangeColumnToUser < ActiveRecord::Migration[6.0]
  def change
    change_column :users, :name, :string, null: false
    change_column :users, :email, :string, null: false
    change_column :users, :password_digest, :string, null: false
    add_column :users, :remember_token, :string
    add_index :users, :email, :unique => true
  end
end
