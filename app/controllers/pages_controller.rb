class PagesController < ApplicationController
	layout "application_v2"

	def home
		@projects = Project.all
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
