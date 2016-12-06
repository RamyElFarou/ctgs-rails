class CreatePresentations < ActiveRecord::Migration
  def change
    create_table :presentations do |t|
      t.string :topic
      t.string :presentation_format
      t.integer :application_request_id

      t.timestamps null: false
    end
  end
end
