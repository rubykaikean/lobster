class CreateCompanySettings < ActiveRecord::Migration
  def change
    create_table :company_settings do |t|
      t.integer :company_id
      t.boolean :allow_multple_booking

      t.timestamps null: false
    end

    add_index :company_settings, :company_id
  end
end
