class RemoveBumiPuteraColumnFromLotTable < ActiveRecord::Migration
  def change
  	remove_column :lots, :is_bumi_putera_unit

  end
end
