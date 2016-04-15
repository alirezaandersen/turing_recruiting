class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :address
      t.string :email
      t.string :phone_number
      t.string :user_name
      t.string :password_digest
      t.string :current_job
      t.string :previous_job

      t.timestamps null: false
    end
  end
end
