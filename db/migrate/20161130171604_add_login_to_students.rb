class AddLoginToStudents < ActiveRecord::Migration
  def change
    add_column :students, :login_id, :string
    add_column :students, :password, :string
  end
end
