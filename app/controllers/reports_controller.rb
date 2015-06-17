class ReportsController < ApplicationController
	before_action :authenticate_user!
	# layout false, only:[:summary_report]

	def summary_report
		# render :text => params
		#@completed_sales = Sale.where("status_id = ?", 2)
	end

end
