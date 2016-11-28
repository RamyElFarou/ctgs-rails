class AddSupervisorToRequesters < ActiveRecord::Migration
  def change
    add_column :requesters, :supervisor_id, :integer
    add_index :requesters, :supervisor_id
  end
end