class AddGeographicalZoneForeignKey < ActiveRecord::Migration
  def change
    rename_column :students, :geographical_zone, :geographical_zone_id
    rename_column :conferences, :geographical_zone, :geographical_zone_id
  end
end
