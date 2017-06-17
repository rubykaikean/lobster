class PagesController < ApplicationController
	layout "application_v3"

	def home
		setting = ProductSetting.find_by(is_star_product: true)
		if setting
			@product = Product.find_by_id(setting.product_id)
		else
			@product = Product.first
		end
		
		
		feature_products = Product.where("id = ")
		# render :text => product_settings.to_json
		

	end

	def listings

	end

	def listing_details

	end

	def blog

	end

	def contact

	end

end
