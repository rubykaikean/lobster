class CreateBlogs < ActiveRecord::Migration
  def change
    create_table :blogs do |t|
      t.string :name
      t.text :description
      t.integer :product_id

      t.timestamps null: false
    end

    add_index :blogs, :product_id
  end
end
