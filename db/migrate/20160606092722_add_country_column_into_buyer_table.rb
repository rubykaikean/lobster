class AddCountryColumnIntoBuyerTable < ActiveRecord::Migration
  def change

  	add_column :buyers, :country, :string

  	add_column :reservation_customizations, :country, :boolean, default: false

  	add_column :reservation_customizations, :country_required, :boolean, default: false

  end
end
