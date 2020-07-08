class ChangeColumnToJobLike < ActiveRecord::Migration[6.0]
  def change
    change_column :job_likes, :user_id, :bigint, null: false
    change_column :job_likes, :job_id, :bigint, null: false
    add_index :job_likes, [:user_id, :job_id], unique: true
    add_foreign_key :job_likes, :users
    add_foreign_key :job_likes, :jobs
  end
end
