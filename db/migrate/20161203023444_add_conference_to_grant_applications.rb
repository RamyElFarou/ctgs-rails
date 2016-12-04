class AddConferenceToGrantApplications < ActiveRecord::Migration
  def change
    add_column :grant_applications, :conference_id, :integer
  end
end
