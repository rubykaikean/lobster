class PagesController < ApplicationController
	layout "application_v3"

	def home
		setting = ProductSetting.find_by(is_star_product: true)
		if setting
			@star_product = Product.find_by_id(setting.product_id)
		else
			@star_product = Product.first
		end
	end

	def listings

		@products = Product.all

	end

	def listing_details

	end

	def blog

	end

	def contact

	end

end
