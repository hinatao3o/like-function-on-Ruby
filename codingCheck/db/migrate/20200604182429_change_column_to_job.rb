class ChangeColumnToJob < ActiveRecord::Migration[6.0]
  def change
    change_column :jobs, :corporation_id, :bigint, null: false
    change_column :jobs, :title, :string, null: false
    change_column :jobs, :description, :text, null: false
    add_foreign_key :jobs, :corporations
  end
end
