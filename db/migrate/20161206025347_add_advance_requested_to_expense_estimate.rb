class AddAdvanceRequestedToExpenseEstimate < ActiveRecord::Migration
  def change
    add_column :application_requests, :advance_requested, :boolean, default: false
  end
end
