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

  def sales
    @product = current_user.company.products.first
    @today_sales = Sale.where(:created_at = Date.current)
    @yesterday_sales = Sale.where(:created_at => (Date.current - 1.day))

    # this week sales
    weeks_array = Date.current.week_split
    weeks_array.each do |week|
      @this_week = week if week.include?(Date.current.day)
    end
    to_day = Date.current
    @this_week_sales = Sale.where(created_at: "#{to_day.year}-#{to_day.month}-#{@this_week.first}".to_date.."#{to_day.year}-#{to_day.month}-#{@this_week.last}".to_date)

    # this month sales
    @this_month_sales = Sale.where(created_at: Date.current.beginning_of_month..Date.current.end_of_month)

    # this quarter sales
    #@this_month_sales = Sale.where(created_at: Date.current.beginning_of_month..Date.current.end_of_month) Date.current.beginning_of_quarter
  end

end
