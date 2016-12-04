class CreatePresentations < ActiveRecord::Migration
  def change
    create_table :presentations do |t|
      t.string :topic
      t.string :type
      t.integer :application_request_id

      t.timestamps null: false
    end
  end
end
