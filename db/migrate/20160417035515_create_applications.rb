class CreateApplications < ActiveRecord::Migration
  def change
    create_table :applications do |t|
      t.belongs_to :job, index: true, foreign_key: true
      t.belongs_to :user, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
