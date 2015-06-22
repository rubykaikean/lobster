class RenameColumnRegionSourcesTypeTable < ActiveRecord::Migration
  def change

  	rename_column :regions, :company_id, :product_id

  	rename_column :sources_types, :company_id, :product_id

  end
end
