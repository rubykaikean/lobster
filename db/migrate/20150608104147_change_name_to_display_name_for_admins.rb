class ChangeNameToDisplayNameForAdmins < ActiveRecord::Migration
  def change
    rename_column :admins, :name, :display_name
  end
end
