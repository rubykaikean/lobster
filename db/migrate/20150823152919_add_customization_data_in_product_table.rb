class AddCustomizationDataInProductTable < ActiveRecord::Migration
  def up
    customize = ReservationCustomization.new
    Product.find_each do |product|
      customize.product_id = product.id
      customize.save!
    end
  end

  def down
    # remove_column :users, :status
  end
end
