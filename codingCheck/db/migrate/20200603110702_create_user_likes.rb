class CreateUserLikes < ActiveRecord::Migration[6.0]
  def change
    create_table :user_likes do |t|
      t.integer :job_id
      t.integer :user_id

      t.timestamps
    end
  end
end
