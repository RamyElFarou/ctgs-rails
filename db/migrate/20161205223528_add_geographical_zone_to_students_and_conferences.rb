class AddGeographicalZoneToStudentsAndConferences < ActiveRecord::Migration
  def change
    add_column :students, :geographical_zone, :integer
    add_column :conferences, :geographical_zone, :integer
  end
end
