class CreateJobs < ActiveRecord::Migration[6.0]
  def change
    create_table :jobs do |t|
      t.bigint :corporation_id
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
