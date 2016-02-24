class AddDisplayNameIntoLotTable < ActiveRecord::Migration
  def change

  	add_column :lots, :display_name, :string

  end
end
