class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :student_number
      t.string :academic_unit
      t.string :program
      t.string :session_number
      t.string :thesis
      t.integer :course_count
      t.string :type              # single table inheritance mechanism: possible values are PHD or Masters

      t.timestamps null: false
    end
  end
end
