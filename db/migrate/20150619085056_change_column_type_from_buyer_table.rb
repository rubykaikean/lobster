class ChangeColumnTypeFromBuyerTable < ActiveRecord::Migration
  def change
    remove_column :buyers, :sources
    add_column :buyers, :sources_type_id, :integer
    
  	
    # remove_column :buyers, :sources
  	# add_column :buyers, :sources_type_id, :integer
  	add_index :buyers, :sources_type_id

    remove_column :buyers, :race
    add_column :buyers, :race, :integer

  	# remove_column :buyers, :race
  	# add_column :buyers, :race, :integer
    
    remove_column :buyers, :age
    add_column :buyers, :age, :integer
  	# remove_column :buyers, :age
  	# add_column :buyers, :age, :integer

    remove_column :buyers, :region
    add_column :buyers, :region_id, :integer
  	# remove_column :buyers, :region
  	# add_column :buyers, :region_id, :integer
    add_index :buyers, :region_id
  end
end
