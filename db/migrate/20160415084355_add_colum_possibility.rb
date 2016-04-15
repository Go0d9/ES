class AddColumPossibility < ActiveRecord::Migration
  def change
    add_column :students, :possibility, :integer
  end
end
