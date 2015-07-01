class ReportsController < ApplicationController
	before_action :authenticate_user!
  before_action :authenticate_project_owner!

	def summary_report
    @product = current_user.company.products.first
    @sales = @product.sales
	end

	def analysis_unit_report
    @product = current_user.company.products.first
		@lots = @product.lots
		@sales = @product.sales
	end

	def analysis_age_report
    @product = current_user.company.products.first
    @sales = @product.sales
    @buyers = []
    @sales.each do |sale|
      @buyers << sale.buyer
    end
	end

  def analysis_race_report
    @product = current_user.company.products.first
    @sales = @product.sales
    @buyers = []
    @sales.each do |sale|
      @buyers << sale.buyer
    end
  end

  def cancellation
    @product = current_user.company.products.first
    @sales = @product.sales.where(status_id: Sale::REJECTED)
  end

	def analysis_sources_type_report
    @product = current_user.company.products.first
    @sales = @product.sales
    @buyers = []
    @sales.each do |sale|
      @buyers << sale.buyer
    end
		name = []
    number = []
    result = []
    @buyers.each do |p|
      name << p.sources_type.try(:name)
      number << p.sources_type.try(:name).to_s
    end

    name.uniq.each do |t|
      result << name.count { |x| x == t }
    end
    @combine = Hash[name.uniq.zip result]
    # render :text => @combine
    # render :text => name.uniq
    # render :text => number
    # render :text => result
    # render :text => name.count { |x| x == "newspaper" }
  end

  def analysis_region_report
    @product = current_user.company.products.first
    @sales = @product.sales
    @buyers = []
    @sales.each do |sale|
      @buyers << sale.buyer
    end
    name = []
    number = []
    result = []
    @buyers.each do |p|
      name << p.region.try(:name)
      number << p.region.try(:name).to_s
    end

    name.uniq.each do |t|
       result << name.count { |x| x == t }
    end
    @combine = Hash[name.uniq.zip result]
  end

  def sales
    @product = current_user.company.products.first
    @today_sales = Sale.where("DATE(confirm_date) = ? and status_id = ?", Date.current, Sale::COMPLETED)
    @yesterday_sales = Sale.where("DATE(confirm_date) = ? and status_id = ?", (Date.current - 1.day), Sale::COMPLETED)

    # this week sales
    weeks_array = Date.current.week_split
    weeks_array.each do |week|
      @this_week = week if week.include?(Date.current.day)
    end
    to_day = Date.current
    # @this_week_sales = Sale.where(confirm_date: "#{to_day.year}-#{to_day.month}-#{@this_week.first}".to_date.."#{to_day.year}-#{to_day.month}-#{@this_week.last}".to_date, status_id: Sale::COMPLETED)

    # this month sales
    @this_month_sales = Sale.where(confirm_date: Date.current.beginning_of_month..Date.current.end_of_month, status_id: Sale::COMPLETED)

    # this quarter sales
    @this_quarter_sales = Sale.where(confirm_date: Date.current.beginning_of_quarter..Date.current.end_of_quarter, status_id: Sale::COMPLETED)

    # this year sales
    @this_year_sales = Sale.where(confirm_date: Date.current.beginning_of_year..Date.current.end_of_year, status_id: Sale::COMPLETED)
  end

  def monthly_sales
    @product = current_user.company.products.first
    jan = "#{Date.current.year}-01-01".to_date
    feb = "#{Date.current.year}-02-01".to_date
    mar = "#{Date.current.year}-03-01".to_date
    apr = "#{Date.current.year}-04-01".to_date
    may = "#{Date.current.year}-05-01".to_date
    jun = "#{Date.current.year}-06-01".to_date
    jul = "#{Date.current.year}-07-01".to_date
    ogo = "#{Date.current.year}-08-01".to_date
    sep = "#{Date.current.year}-09-01".to_date
    oct = "#{Date.current.year}-10-01".to_date
    nov = "#{Date.current.year}-11-01".to_date
    dec = "#{Date.current.year}-12-01".to_date
    @jan_sales = Sale.where(confirm_date: jan.beginning_of_month..jan.end_of_month, status_id: Sale::COMPLETED, product_id: @product.id)
    @feb_sales = Sale.where(confirm_date: feb.beginning_of_month..feb.end_of_month, status_id: Sale::COMPLETED, product_id: @product.id)
    @mar_sales = Sale.where(confirm_date: mar.beginning_of_month..mar.end_of_month, status_id: Sale::COMPLETED, product_id: @product.id)
    @apr_sales = Sale.where(confirm_date: apr.beginning_of_month..apr.end_of_month, status_id: Sale::COMPLETED, product_id: @product.id)
    @may_sales = Sale.where(confirm_date: may.beginning_of_month..may.end_of_month, status_id: Sale::COMPLETED, product_id: @product.id)
    @jun_sales = Sale.where(confirm_date: jun.beginning_of_month..jun.end_of_month, status_id: Sale::COMPLETED, product_id: @product.id)
    @jul_sales = Sale.where(confirm_date: jul.beginning_of_month..jul.end_of_month, status_id: Sale::COMPLETED, product_id: @product.id)
    @ogo_sales = Sale.where(confirm_date: ogo.beginning_of_month..ogo.end_of_month, status_id: Sale::COMPLETED, product_id: @product.id)
    @sep_sales = Sale.where(confirm_date: sep.beginning_of_month..sep.end_of_month, status_id: Sale::COMPLETED, product_id: @product.id)
    @oct_sales = Sale.where(confirm_date: oct.beginning_of_month..oct.end_of_month, status_id: Sale::COMPLETED, product_id: @product.id)
    @nov_sales = Sale.where(confirm_date: nov.beginning_of_month..nov.end_of_month, status_id: Sale::COMPLETED, product_id: @product.id)
    @dec_sales = Sale.where(confirm_date: dec.beginning_of_month..dec.end_of_month, status_id: Sale::COMPLETED, product_id: @product.id)
    
  end

  def agency_sales
    if is_top_level_management?
      @product = current_user.company.products.first
      agencies = current_user.company.agencies.order(:name)
      @result = []
      @pie_chart_data = []
      current_company = current_user.company
      sales = Sale.where("user_id IN(?) and status_id = ? and product_id = ?", current_company.user_ids, Sale::COMPLETED, @product.id)
      @result << [current_company, sales]
      total = sales.inject(0) do |sum, sale|
        lot = sale.lot
        sum += lot.selling_price
      end
      @pie_chart_data << [current_company.name, total]

      agencies.each do |agency|
        sales = Sale.where("user_id IN(?) and status_id = ? and product_id = ?", agency.user_ids, Sale::COMPLETED, @product.id)
        @result << [agency, sales]
        total = sales.inject(0) do |sum, sale|
          lot = sale.lot
          sum += lot.selling_price
        end
        @pie_chart_data << [agency.name, total]
      end
    else
      flash[:alert] = "Sorry, you don't have access right."
      redirect_to :back
    end
  end
  
  # ============ excel ===============

  def export_sources_type_excel

    @product = current_user.company.products.first
    @sales = @product.sales
    @buyers = []
    @sales.each do |sale|
      @buyers << sale.buyer
    end
    sources_name = []
    result = []
    @buyers.each do |p|
      sources_name << p.sources_type.try(:name)
    end

    sources_name.uniq.each do |t|
      result << sources_name.count { |x| x == t }
    end
    @source_combine = Hash[sources_name.uniq.zip result]
    respond_to do |format|
      format.csv { render text: @source_combine.to_csv }
      format.xls
    end
  end

  def export_regions_excel
    @product = current_user.company.products.first
    @sales = @product.sales
    @buyers = []
    @sales.each do |sale|
      @buyers << sale.buyer
    end
        name = []
        number = []
        result = []
        @buyers.each do |p|
          name << p.region.try(:name)
          number << p.region.try(:name).to_s
        end

        name.uniq.each do |t|
           result << name.count { |x| x == t }
        end
        @region_combine = Hash[name.uniq.zip result]

    respond_to do |format|
      format.csv { render text: @region_combine.to_csv }
      format.xls
    end
  end

  def export_analysis_age_race_excel
    @product = current_user.company.products.first
    @sales = @product.sales
    @buyers = []
    @sales.each do |sale|
      @buyers << sale.buyer
    end
    respond_to do |format|
      format.csv { render text: @buyers.to_csv }
      format.xls
    end
  end

  def export_summary_report_excel
    @product = current_user.company.products.first
    @sales = @product.sales
    respond_to do |format|
      format.csv { render text: @sales.to_csv }
      format.xls
    end
  end


end
