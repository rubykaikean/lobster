class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :display_name
      t.integer :type_id
      t.integer :company_id
      t.string :slug

      t.timestamps null: false
    end
    add_index :users, :slug, unique: true
    add_index :users, :company_id
  end
end
