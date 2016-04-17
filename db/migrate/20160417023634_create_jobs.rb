class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string :department
      t.string :title
      t.string :description
      t.string :requirements
      t.integer :salary

      t.timestamps null: false
    end
  end
end
