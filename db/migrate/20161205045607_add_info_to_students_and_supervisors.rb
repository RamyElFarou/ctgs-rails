class AddInfoToStudentsAndSupervisors < ActiveRecord::Migration
  def change
    add_column :students, :first_name, :string
    add_column :students, :last_name, :string
    add_column :students, :email, :string
    
    add_column :supervisors, :first_name, :string
    add_column :supervisors, :last_name, :string
    add_column :supervisors, :email, :string
  end
end
