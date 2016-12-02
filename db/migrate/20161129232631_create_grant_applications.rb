class CreateGrantApplications < ActiveRecord::Migration
  def change
    create_table :grant_applications do |t|
      t.integer :student_id
      
      t.timestamps null: false
    end
  end
end
