class ReportsController < ApplicationController
	before_action :authenticate_user!
	# layout false, only:[:summary_report]

	def summary_report
		@sales = Sale.all
	end

	def analysis_report
		@lots = Lot.all
		@sales = Sale.all
		@buyers = Buyer.all
			# name = []
	  #  	number = []
	  # 	@lots.each do |p|
	  #     name << p.status_id
	  #     number << p.number.to_i
	  #   end
	  #  @combine = Hash[name.zip number]
	   # render :text => name
		
	end

end
