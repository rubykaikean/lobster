class AddProductTypeIdToLots < ActiveRecord::Migration
  def change
    add_column :lots, :product_type_id, :integer
    add_index :lots, :product_type_id
  end
end
