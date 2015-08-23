class CreateReservationCustomizations < ActiveRecord::Migration
  def change
    create_table :reservation_customizations do |t|
      t.integer :product_id
      t.boolean :full_name              , default: false
      t.boolean :ic_number              , default: false
      t.boolean :address                , default: false
      t.boolean :mobile_contact_number  , default: false
      t.boolean :home_contact_number    , default: false
      t.boolean :office_contact_number  , default: false
      t.boolean :email                  , default: false
      t.boolean :gender                 , default: false
      t.boolean :is_bumi_putera         , default: false
      t.boolean :race                   , default: false
      t.boolean :age                    , default: false
      t.boolean :buyer_second_name      , default: false
      t.boolean :buyer_third_name       , default: false
      t.boolean :second_ic_number       , default: false
      t.boolean :third_ic_number        , default: false
      t.boolean :postcode               , default: false
      t.boolean :downpayment            , default: false
      t.boolean :downpayment_percentage , default: false
      t.boolean :spa                    , default: false
      t.boolean :booking_fee            , default: false
      t.boolean :reject_reason          , default: false
      t.boolean :downpayment_type       , default: false
      t.boolean :confirm_date           , default: false
      t.boolean :sale_date              , default: false
      t.boolean :selling_price          , default: false

      t.timestamps null: false
    end

    add_index :reservation_customizations, :product_id
  end
end
