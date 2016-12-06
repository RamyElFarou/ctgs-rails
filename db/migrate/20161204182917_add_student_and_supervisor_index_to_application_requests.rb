class AddStudentAndSupervisorIndexToApplicationRequests < ActiveRecord::Migration
  def change
    add_index :application_requests, :student_id
    add_index :application_requests, :supervisor_id
  end
end
