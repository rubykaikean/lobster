class AddRowKeyToLots < ActiveRecord::Migration
  def change
    add_column :lots, :row_key, :integer, default: 1
  end
end
