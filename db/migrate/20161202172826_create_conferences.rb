class CreateConferences < ActiveRecord::Migration
  def change
    create_table :conferences do |t|
      t.string :start_date
      t.string :end_date
      t.string :website
      t.string :location

      t.timestamps null: false
    end
  end
end
