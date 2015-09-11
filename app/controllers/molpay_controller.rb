class MolpayController < ApplicationController
	before_action :authenticate_user!, only: [:molpay, :subscribe]
	skip_before_filter :verify_authenticity_token, :only => :return_url

	def subscribe
		@sale = Sale.find(params[:id])
		@order = MolpayTransactionHistory.last
	end

	def create_molpay_transaction
		# render :text => molpay_params
		transaction = MolpayTransactionHistory.new(molpay_params)
		if transaction.save
			redirect_to molpay_molpay_path(:sale_id => molpay_params[:sale_id])
		else
			redirect_to molpay_subscribe_path(:id => molpay_params[:sale_id]), :notice => "Order ID had been duplicate! Submit Again."
		end
	end

	def molpay
		# render :text => molpay_params
		@molpay = MolpayTransactionHistory.find_by(sale_id: params[:sale_id])
		# render :text => @molpay.to_json


		#	here is logger info params
		# Parameters: {"skey"=>"8e0486d4786a7a22a21fe7b32ce041a3", 
		# "tranID"=>"3742126", "domain"=>"estatekitkat", "status"=>"00", 
		# "amount"=>"100.00", "currency"=>"RM", "paydate"=>"2014-10-31 16:34:23", 
		# "orderid"=>"PA0001", "appcode"=>"", "error_code"=>"", "error_desc"=>"", 
		# "channel"=>"CIMB-Clicks"}]
		# key0 = 3a8889b6b7965929131d47cae736953a
		# here is return url
		# here is return url failure
	end

	def return_url
		# render :text => params.to_json
		# # nbcb = params[:nbcb]
		transaction_params = {
							:amount => params[:amount],
							:tran_id => params[:tranID],
							:order_id => params[:orderid],
							:status => params[:status],
							:domain => params[:domain],
							:currency => params[:currency],
							:appcode => params[:appcode],
							:paydate => params[:paydate],
							:channel => params[:channel],
							:error_code => params[:error_code],
							:error_desc => params[:error_desc],
							:skey => params[:skey]
						}
			molpay = MolpayTransactionHistory.find_by(order_id: transaction_params[:order_id])
			molpay.update(transaction_params)
			if params[:status] == 00
				logger.info {"molpay -- Status success "}
				redirect_to molpay_transaction_histories_path(order_id: transaction_params[:order_id]), :notice => "Molpay payment successfully Paid."

			elsif params[:status] == 22
				logger.info {"molpay -- Status still pending"}
				redirect_to root_url, :notice => "Molpay payment still pending. Any question contact admin!"
			elsif params[:status] == 11
				logger.info {"molpay -- Status Failure"}
				redirect_to root_url, :notice => "Molpay payment still failure. Any question contact admin!"			
			else
				logger.info {"molpay -- Status Empty"}
				redirect_to root_url, :notice => "Molpay payment din send any status, contact Admin!"
			end
	end

	# def molpay_failure
	# 	# {"skey"=>"4dd56692aaabd2da5fbdd6c5cd91458c",
	# 	#  "tranID"=>"5309405",
	# 	#  "domain"=>"estatekitkat",
	# 	#  "status"=>"11",
	# 	#  "amount"=>"2.00",
	# 	#  "currency"=>"RM",
	# 	#  "paydate"=>"2015-09-10 16:29:13",
	# 	#  "orderid"=>"10004",
	# 	#  "appcode"=>"",
	# 	#  "error_code"=>"",
	# 	#  "error_desc"=>"",
	# 	#  "channel"=>"CIMB-Clicks"}

	# end

	private

	def molpay_params
      params.require(:molpay).permit!
  end


end
