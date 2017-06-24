class PagesController < ApplicationController
	# default from: "noreply@gmail.com"
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
		
		@product = Product.friendly.find(params[:product])

		@other_product = Product.where.not("id = ?", @product.id)

		@users = User.take(2)
	
	end

	def blog
		@blogs = Blog.all
	end

	def blog_details
		@blog_detail = Blog.find(params[:blog_id])
		
	end

	def contact

	end

	def team

	end

	def service

	end

	def about_us

	end

	def sign_up_email
		# render :text => params[:email]
		ApplicationMailer.notice_sign_up(params[:email]).deliver_now
		redirect_to :back, notice: "Thank you sign up."
		# render :text => params
	end

end
