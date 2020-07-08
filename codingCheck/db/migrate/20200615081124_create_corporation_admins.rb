class CreateCorporationAdmins < ActiveRecord::Migration[6.0]
  def change
    create_table :corporation_admins do |t|
      t.bigint :corporation_id, null: false
      t.string :name, null: false
      t.string :email, null: false
      t.string :password_digest, null: false

      t.timestamps

    end
  end
end
