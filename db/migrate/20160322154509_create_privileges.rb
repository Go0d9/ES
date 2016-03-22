class CreatePrivileges < ActiveRecord::Migration
  def change
    create_table :privileges do |t|
    	t.string :title
    	t.string :description
    	t.float  :coefficient
    end
  end
end
