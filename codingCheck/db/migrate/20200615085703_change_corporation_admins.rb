class ChangeCorporationAdmins < ActiveRecord::Migration[6.0]
  def change
    add_index :corporation_admins, :email, :unique => true
    add_column :corporation_admins, :remember_token, :string
  end
end
