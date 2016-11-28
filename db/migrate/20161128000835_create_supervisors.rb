class CreateSupervisors < ActiveRecord::Migration
  def change
    create_table :supervisors do |t|
      t.string :employee_id

      t.timestamps null: false
    end
  end
end
