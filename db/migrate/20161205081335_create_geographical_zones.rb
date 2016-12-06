class CreateGeographicalZones < ActiveRecord::Migration
  def change
    create_table :geographical_zones do |t|
      t.string :category
      t.decimal :masters_grant_limit
      t.decimal :phd_grant_limit

      t.timestamps null: false
    end
  end
end
