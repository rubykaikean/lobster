# == Schema Information
#
# Table name: lots
#
#  id              :integer          not null, primary key
#  name            :string
#  description     :text
#  product_id      :integer
#  slug            :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  product_type_id :integer
#  status_id       :integer          default(1)
#
# Indexes
#
#  index_lots_on_product_id       (product_id)
#  index_lots_on_product_type_id  (product_type_id)
#  index_lots_on_slug             (slug) UNIQUE
#

class LotSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :product_id
end
