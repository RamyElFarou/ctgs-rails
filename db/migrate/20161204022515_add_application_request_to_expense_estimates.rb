class AddApplicationRequestToExpenseEstimates < ActiveRecord::Migration
  def change
    rename_column :expense_estimates, :grant_application_id, :application_request_id
  end
end
