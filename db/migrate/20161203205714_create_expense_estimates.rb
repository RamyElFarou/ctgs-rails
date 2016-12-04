class CreateExpenseEstimates < ActiveRecord::Migration
  def change
    create_table :expense_estimates do |t|
      t.decimal :registration
      t.decimal :transportation
      t.decimal :accomodation
      t.decimal :meals
      t.decimal :total
    
      t.integer :grant_application_id

      t.timestamps null: false
    end
  end
end
