class CreateStudentsBenefits < ActiveRecord::Migration
  def change
    create_table :students_benefits do |t|
			t.belongs_to :student, index: true
		  t.belongs_to :benefit, index: true
    end
  end
end
