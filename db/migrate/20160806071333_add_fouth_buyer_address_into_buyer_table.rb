class AddFouthBuyerAddressIntoBuyerTable < ActiveRecord::Migration
  def change

  	add_column :buyers, :buyer_fouth_address, :string, :limit => nil

  end
end
