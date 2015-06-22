class ReportsController < ApplicationController
	before_action :authenticate_user!
	# layout false, only:[:summary_report]

	def summary_report
		@sales = Sale.all
	end

	def analysis_unit_report
		@lots = Lot.all
		@sales = Sale.all
	end

	def analysis_age_report
		@buyers = Buyer.all
	end

	def analysis_sources_type_report
		# @buyers = Buyer.all
		# name = []
  	# number = []
    # @buyers.each do |p|
    #   name << p.sources_type.try(:name)
    #   number << p.sources_type_id.count
    # end
    # render :text => number
    # @combine = Hash[name.zip number]
	end


	def analysis_race_report
		@buyers = Buyer.all
	end

  def sales
    @product = current_user.company.products.first
    @today_sales = Sale.where(:created_at => Date.current, status_id: Sale::COMPLETED)
    @yesterday_sales = Sale.where(:created_at => (Date.current - 1.day), status_id: Sale::COMPLETED)

    # this week sales
    weeks_array = Date.current.week_split
    weeks_array.each do |week|
      @this_week = week if week.include?(Date.current.day)
    end
    to_day = Date.current
    @this_week_sales = Sale.where(created_at: "#{to_day.year}-#{to_day.month}-#{@this_week.first}".to_date.."#{to_day.year}-#{to_day.month}-#{@this_week.last}".to_date, status_id: Sale::COMPLETED)

    # this month sales
    @this_month_sales = Sale.where(created_at: Date.current.beginning_of_month..Date.current.end_of_month, status_id: Sale::COMPLETED)

    # this quarter sales
    @this_quarter_sales = Sale.where(created_at: Date.current.beginning_of_quarter..Date.current.end_of_quarter, status_id: Sale::COMPLETED)

    # this year sales
    @this_year_sales = Sale.where(created_at: Date.current.beginning_of_year..Date.current.end_of_year, status_id: Sale::COMPLETED)
  end

end
