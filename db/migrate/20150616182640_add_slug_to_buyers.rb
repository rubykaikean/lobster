class AddSlugToBuyers < ActiveRecord::Migration
  def change
    add_column :buyers, :slug, :string
    add_index :buyers, :slug, unique: true
  end
end
