class CreateBenefits < ActiveRecord::Migration
  def change
    create_table :benefits do |t|
			t.string :title
			t.string :description
    	t.float  :coefficient 	
      t.timestamps null: false
    end
  end
end
