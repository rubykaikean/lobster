class CreateAuthorizeProductUsers < ActiveRecord::Migration
  def change
    create_table :authorize_product_users do |t|
      t.belongs_to :product, index: true
      t.belongs_to :user, index: true

      t.timestamps null: false
    end
  end
end
