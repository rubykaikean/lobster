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
		@buyers = Buyer.all
		name = []
  	    number = []
        @buyers.each do |p|
          name << p.sources_type.try(:name)
          number << p.sources_type.id
        end
        # @combine = Hash[name.zip number]
    	render :text => number.count
    end


	def analysis_race_report
		@buyers = Buyer.all
	end

  def sales
    @product = current_user.company.products.first
    @today_sales = Sale.where("DATE(updated_at) = ? and status_id = ?", Date.current, Sale::COMPLETED)
    @yesterday_sales = Sale.where("DATE(updated_at) = ? and status_id = ?", (Date.current - 1.day), Sale::COMPLETED)

    # this week sales
    weeks_array = Date.current.week_split
    weeks_array.each do |week|
      @this_week = week if week.include?(Date.current.day)
    end
    to_day = Date.current
    @this_week_sales = Sale.where(updated_at: "#{to_day.year}-#{to_day.month}-#{@this_week.first}".to_date.."#{to_day.year}-#{to_day.month}-#{@this_week.last}".to_date, status_id: Sale::COMPLETED)

    # this month sales
    @this_month_sales = Sale.where(updated_at: Date.current.beginning_of_month..Date.current.end_of_month, status_id: Sale::COMPLETED)

    # this quarter sales
    @this_quarter_sales = Sale.where(updated_at: Date.current.beginning_of_quarter..Date.current.end_of_quarter, status_id: Sale::COMPLETED)

    # this year sales
    @this_year_sales = Sale.where(updated_at: Date.current.beginning_of_year..Date.current.end_of_year, status_id: Sale::COMPLETED)
  end

  def monthly_sales
    jan = "#{Date.current.year}-01-#{Date.current.day}".to_date
    feb = "#{Date.current.year}-02-#{Date.current.day}".to_date
    mar = "#{Date.current.year}-03-#{Date.current.day}".to_date
    apr = "#{Date.current.year}-04-#{Date.current.day}".to_date
    may = "#{Date.current.year}-05-#{Date.current.day}".to_date
    jun = "#{Date.current.year}-06-#{Date.current.day}".to_date
    jul = "#{Date.current.year}-07-#{Date.current.day}".to_date
    ogo = "#{Date.current.year}-08-#{Date.current.day}".to_date
    sep = "#{Date.current.year}-09-#{Date.current.day}".to_date
    oct = "#{Date.current.year}-10-#{Date.current.day}".to_date
    nov = "#{Date.current.year}-11-#{Date.current.day}".to_date
    dec = "#{Date.current.year}-12-#{Date.current.day}".to_date
    @jan_sales = Sale.where(updated_at: jan.beginning_of_month..jan.end_of_month, status_id: Sale::COMPLETED)
    @feb_sales = Sale.where(updated_at: feb.beginning_of_month..feb.end_of_month, status_id: Sale::COMPLETED)
    @mar_sales = Sale.where(updated_at: mar.beginning_of_month..mar.end_of_month, status_id: Sale::COMPLETED)
    @apr_sales = Sale.where(updated_at: apr.beginning_of_month..apr.end_of_month, status_id: Sale::COMPLETED)
    @may_sales = Sale.where(updated_at: may.beginning_of_month..may.end_of_month, status_id: Sale::COMPLETED)
    @jun_sales = Sale.where(updated_at: jun.beginning_of_month..jun.end_of_month, status_id: Sale::COMPLETED)
    @jul_sales = Sale.where(updated_at: jul.beginning_of_month..jul.end_of_month, status_id: Sale::COMPLETED)
    @ogo_sales = Sale.where(updated_at: ogo.beginning_of_month..ogo.end_of_month, status_id: Sale::COMPLETED)
    @sep_sales = Sale.where(updated_at: sep.beginning_of_month..sep.end_of_month, status_id: Sale::COMPLETED)
    @oct_sales = Sale.where(updated_at: oct.beginning_of_month..oct.end_of_month, status_id: Sale::COMPLETED)
    @nov_sales = Sale.where(updated_at: nov.beginning_of_month..nov.end_of_month, status_id: Sale::COMPLETED)
    @dec_sales = Sale.where(updated_at: dec.beginning_of_month..dec.end_of_month, status_id: Sale::COMPLETED)
    
  end

end
