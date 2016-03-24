class RenameStudentsBenefits < ActiveRecord::Migration
	def self.up
    rename_table :students_benefits, :benefits_students
  end 
  def self.down
    rename_table :benefits_students, :students_benefits
  end
end
