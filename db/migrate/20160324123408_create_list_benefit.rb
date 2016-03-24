class CreateListBenefit < ActiveRecord::Migration
  def change
    create_table :list_benefits do |t|
    	t.integer :student_id
    	t.integer :benefit_id
    end
  end
end
