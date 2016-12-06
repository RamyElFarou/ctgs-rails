class AddIndexToConfernceInGrantApplications < ActiveRecord::Migration
  def change
    add_index :grant_applications, :conference_id
  end
end
