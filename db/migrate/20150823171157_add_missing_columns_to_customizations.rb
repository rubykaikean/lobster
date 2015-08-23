class AddMissingColumnsToCustomizations < ActiveRecord::Migration
  def change
    add_column :reservation_customizations, :region_id, :boolean, default: false
    add_column :reservation_customizations, :region_id_required, :boolean, default: false
    add_column :reservation_customizations, :nationality_id, :boolean, default: false
    add_column :reservation_customizations, :nationality_id_required, :boolean, default: false
    add_column :reservation_customizations, :sources_type_id, :boolean, default: false
    add_column :reservation_customizations, :sources_type_id_required, :boolean, default: false
  end
end
