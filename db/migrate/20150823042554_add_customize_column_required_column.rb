class AddCustomizeColumnRequiredColumn < ActiveRecord::Migration
  def change

      add_column :reservation_customizations, :full_name_required, :boolean						 	 , default: false
      add_column :reservation_customizations, :ic_number_required, :boolean              , default: false
      add_column :reservation_customizations, :address_required, :boolean                , default: false
      add_column :reservation_customizations, :mobile_contact_number_required, :boolean  , default: false
      add_column :reservation_customizations, :home_contact_number_required, :boolean    , default: false
      add_column :reservation_customizations, :office_contact_number_required, :boolean  , default: false
      add_column :reservation_customizations, :email_required, :boolean                  , default: false
      add_column :reservation_customizations, :gender_required, :boolean                 , default: false
      add_column :reservation_customizations, :is_bumi_putera_required, :boolean         , default: false
      add_column :reservation_customizations, :race_required, :boolean                   , default: false
      add_column :reservation_customizations, :age_required, :boolean                    , default: false
      add_column :reservation_customizations, :buyer_second_name_required, :boolean      , default: false
      add_column :reservation_customizations, :buyer_third_name_required, :boolean       , default: false
      add_column :reservation_customizations, :second_ic_number_required, :boolean       , default: false
      add_column :reservation_customizations, :third_ic_number_required, :boolean        , default: false
      add_column :reservation_customizations, :postcode_required, :boolean               , default: false
      add_column :reservation_customizations, :downpayment_required, :boolean            , default: false
      add_column :reservation_customizations, :downpayment_percentage_required, :boolean , default: false
      add_column :reservation_customizations, :spa_required, :boolean                    , default: false
      add_column :reservation_customizations, :booking_fee_required, :boolean            , default: false
      add_column :reservation_customizations, :reject_reason_required, :boolean          , default: false
      add_column :reservation_customizations, :downpayment_type_required, :boolean       , default: false
      add_column :reservation_customizations, :confirm_date_required, :boolean           , default: false
      add_column :reservation_customizations, :sale_date_required, :boolean              , default: false
      add_column :reservation_customizations, :selling_price_required, :boolean          , default: false

  end
end
