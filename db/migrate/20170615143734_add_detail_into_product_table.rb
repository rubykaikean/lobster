class AddDetailIntoProductTable < ActiveRecord::Migration
  def change

  	add_column :products, :address, :string

  	add_column :products, :location, :string

  	add_column :products, :display_price, :integer

  	add_column :products, :display_sqft, :integer

  	add_column :products, :currency, :string

  	add_column :products, :completion_date, :datetime

  	add_column :products, :details_description, :text

  	add_column :products, :nearby_location_description, :text

  	add_column :product_settings, :is_feature_product, :boolean, :default => false

  	add_column :product_settings, :is_star_product, :boolean, :default => false

  end

  

end
