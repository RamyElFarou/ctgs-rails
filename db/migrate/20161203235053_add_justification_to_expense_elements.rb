class AddJustificationToExpenseElements < ActiveRecord::Migration
  def change
    add_column :expense_estimates, :justification, :text
  end
end
