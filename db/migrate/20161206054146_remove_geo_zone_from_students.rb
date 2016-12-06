class RemoveGeoZoneFromStudents < ActiveRecord::Migration
  def change
    remove_column :students, :geographical_zone_id
  end
end
