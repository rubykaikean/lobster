class CreateCompanyProductsLinkages < ActiveRecord::Migration
  def change
    create_table :company_products_linkages do |t|
      t.integer :company_id
      t.integer :product_id

      t.timestamps null: false
    end

    add_index :company_products_linkages, :company_id
	  add_index :company_products_linkages, :product_id

	  add_column :companies, :extended_url, :string
  end
end
