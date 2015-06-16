class AddColumnIntoBuyerTable < ActiveRecord::Migration
  def change
  	add_column :buyers, :gender, :integer

  	add_column :buyers, :age, :integer

  	add_column :buyers, :region, :string

  	add_column :buyers, :race, :string

  	add_column :buyers, :sources, :string

  end
end
