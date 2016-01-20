class AddRegionCodeAndBuyerAddressIntoRegionTable < ActiveRecord::Migration
  
	def up
		add_column :regions, :region_code, :string, :limit => 3

  	add_column :buyers, :buyer_second_address, :string, :limit => 40

  	add_column :buyers, :buyer_third_address, :string, :limit => 40		
	
  	change_column :buyers, :address, :string
	end

	def down

		remove_column :regions, :region_code
		remove_column :buyers, :buyer_second_address
		remove_column :buyers, :buyer_third_address
		change_column :buyers, :address, :text
	end

end
