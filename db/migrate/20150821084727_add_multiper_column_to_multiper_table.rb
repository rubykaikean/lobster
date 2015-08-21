class AddMultiperColumnToMultiperTable < ActiveRecord::Migration
  def change
  	add_column :buyers, :nationality_id, :integer
  	add_column :buyers, :postcode, :integer
  	add_column :lots, :car_park, :integer

  	add_index :buyers, :nationality_id
  end
end
