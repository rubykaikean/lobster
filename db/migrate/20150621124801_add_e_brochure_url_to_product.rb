class AddEBrochureUrlToProduct < ActiveRecord::Migration
  def change
    add_column :products, :e_brochure_url, :string
  end
end
