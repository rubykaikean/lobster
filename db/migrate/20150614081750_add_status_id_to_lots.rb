class AddStatusIdToLots < ActiveRecord::Migration
  def change
    add_column :lots, :status_id, :integer, default: 1
  end
end
