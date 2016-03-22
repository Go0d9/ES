class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
    	t.string :second_name 
    	t.string :first_name
    	t.string :middle_name
    	t.float :group
    	t.boolean :sex
      t.timestamps null: false
    end
  end
end
