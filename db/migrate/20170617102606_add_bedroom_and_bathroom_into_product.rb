class AddBedroomAndBathroomIntoProduct < ActiveRecord::Migration
  def change

  	add_column :products, :bedroom, :integer

  	add_column :products, :bathroom, :integer

  end
end
