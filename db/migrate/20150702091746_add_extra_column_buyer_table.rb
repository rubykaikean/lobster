class AddExtraColumnBuyerTable < ActiveRecord::Migration
  def change

  	add_column :buyers, :buyer_second_name, :string
  	add_column :buyers, :buyer_third_name, :string

  	add_column :buyers, :second_ic_number, :string
  	add_column :buyers, :third_ic_number, :string

  end
end
