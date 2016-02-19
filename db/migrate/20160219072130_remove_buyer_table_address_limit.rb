class RemoveBuyerTableAddressLimit < ActiveRecord::Migration
  def change

  	change_column :buyers, :address, :string, :limit => nil
  	change_column :buyers, :buyer_second_address, :string, :limit => nil
  	change_column :buyers, :buyer_third_address, :string, :limit => nil


  end
end
