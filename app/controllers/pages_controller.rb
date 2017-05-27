class PagesController < ApplicationController
	layout "application_v2"

	def home
		@projects = Project.all
	end

	def ibrochure

	end

	def about_us

	end

	def contact_us

	end

	def news

	end

	def project_details

	end


end
