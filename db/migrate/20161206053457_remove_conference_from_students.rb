class RemoveConferenceFromStudents < ActiveRecord::Migration
  def change
    remove_column :students, :conference_id
  end
end
