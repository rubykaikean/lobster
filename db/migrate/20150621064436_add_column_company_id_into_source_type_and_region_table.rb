class AddColumnCompanyIdIntoSourceTypeAndRegionTable < ActiveRecord::Migration
  def change
  	add_column :sources_types, :company_id, :integer

  	add_column :regions, :company_id, :integer
  end
end
