class ChangeColumnTypeFromBuyerTable < ActiveRecord::Migration
  def change
    rename_column :buyers, :sources, :sources_type_id
    change_column :buyers, :sources_type_id, :integer
  	
    # remove_column :buyers, :sources
  	# add_column :buyers, :sources_type_id, :integer
  	add_index :buyers, :sources_type_id


    change_column :buyers, :race, :integer

  	# remove_column :buyers, :race
  	# add_column :buyers, :race, :integer

    change_column :buyers, :age, :integer
  	# remove_column :buyers, :age
  	# add_column :buyers, :age, :integer

    rename_column :buyers, :region, :region_id
    change_column :buyers, :region_id, :integer
  	# remove_column :buyers, :region
  	# add_column :buyers, :region_id, :integer
    add_index :buyers, :region_id
  end
end
