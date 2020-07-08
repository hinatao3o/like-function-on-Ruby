class ChangeColumnToUserLike < ActiveRecord::Migration[6.0]
  def change
    change_column :user_likes, :job_id, :bigint, null: false
    change_column :user_likes, :user_id, :bigint, null: false
    add_index :user_likes, [:job_id, :user_id], unique: true
    add_foreign_key :user_likes, :jobs
    add_foreign_key :user_likes, :users
  end
end
