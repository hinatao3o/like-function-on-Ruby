class ChangeColumnToCorporation < ActiveRecord::Migration[6.0]
  def change
    change_column :corporations, :name, :string, null: false
  end
end
