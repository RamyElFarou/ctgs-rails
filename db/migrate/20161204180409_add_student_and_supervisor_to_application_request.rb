class AddStudentAndSupervisorToApplicationRequest < ActiveRecord::Migration
  def change
    add_column :application_requests, :student_id, :integer
    add_column :application_requests, :supervisor_id, :integer
  end
end
