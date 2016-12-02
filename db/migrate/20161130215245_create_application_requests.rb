class CreateApplicationRequests < ActiveRecord::Migration
  def change
    create_table :application_requests do |t|
      t.integer :grant_application_id
      t.string :status

      t.timestamps null: false
    end
  end
end
