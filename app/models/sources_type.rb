# == Schema Information
#
# Table name: sources_types
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  product_id :integer
#

class SourcesType < ActiveRecord::Base
	has_many :buyers
  belongs_to :product


end
