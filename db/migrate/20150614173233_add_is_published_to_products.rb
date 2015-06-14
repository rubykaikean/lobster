class AddIsPublishedToProducts < ActiveRecord::Migration
  def change
    add_column :products, :is_published, :boolean, default: false
  end
end
