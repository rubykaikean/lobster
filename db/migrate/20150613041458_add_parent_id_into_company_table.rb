class AddParentIdIntoCompanyTable < ActiveRecord::Migration
  def change
  	add_column :companies, :parent_id, :integer
  	add_index :companies, :parent_id

  	rename_column :company_settings, :allow_multple_booking, :allow_multiple_booking
  end
end
