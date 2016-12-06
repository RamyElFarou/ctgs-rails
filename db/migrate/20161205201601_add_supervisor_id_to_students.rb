class AddSupervisorIdToStudents < ActiveRecord::Migration
  def change
    add_column :students, :supervisor_id, :integer
  end
end
