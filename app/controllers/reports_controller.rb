class ReportsController < ApplicationController
	before_action :authenticate_user!
	# layout false, only:[:summary_report]

	def summary_report
		@sales = Sale.all
	end

	def analysis_unit_report
		@lots = Lot.all
	end

	def analysis_age_report
		@buyers = Buyer.all
	end

	def analysis_sources_type_report
		@buyers = Buyer.all
		name = []
    number = []
    @buyers.each do |p|
      name << p.sources_type.try(:name)
      number << p.source_type
    end
    # render :text => name
    # @combine = Hash[name.zip number]
	end

end
