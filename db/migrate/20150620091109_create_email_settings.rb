class CreateEmailSettings < ActiveRecord::Migration
  def change
    create_table :email_settings do |t|
      t.integer :product_id
      t.string :subject
      t.string :from
      t.text :body

      t.timestamps null: false
    end

    add_index :email_settings, :product_id
  end
end
