class AddSuggestedChangesToApplicationRequests < ActiveRecord::Migration
  
  def change
    add_column :application_requests, :suggested_changes, :string 
  end
  
end
