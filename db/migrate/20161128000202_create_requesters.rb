class CreateRequesters < ActiveRecord::Migration
  def change
    create_table :requesters do |t|
      t.string :student_id

      t.timestamps null: false
    end
  end
end
