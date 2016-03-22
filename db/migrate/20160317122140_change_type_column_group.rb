class ChangeTypeColumnGroup < ActiveRecord::Migration
  def up
  	change_column :students, :group, :intage
  end
  def down
  	change_column :students, :group, :float
  end
end
