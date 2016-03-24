class DropTablesPrivilegesAndListBenefits < ActiveRecord::Migration
  def change
  	drop_table :list_benefits
  	drop_table :privileges
  end
end
