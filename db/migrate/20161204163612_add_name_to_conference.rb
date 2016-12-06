class AddNameToConference < ActiveRecord::Migration
  def change
    add_column :conferences, :name, :string
  end
end
