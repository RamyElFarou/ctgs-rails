class CreateSupervisors < ActiveRecord::Migration
  def change
    create_table :supervisors do |t|
      t.string :login_id
      t.string :password_digest
      t.string :employee_number

      t.timestamps null: false
    end
  end
end
