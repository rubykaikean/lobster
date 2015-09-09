class MolpayController < ApplicationController
	before_action :authenticate_user!, only: [:molpay, :subscribe]
	skip_before_filter :verify_authenticity_token, :only => :return_url

	def subscribe
		@sale = Sale.find(params[:id])
		@order = MolpayTransactionHistory.where("sale_id = ?",@sale.id).last
	end

	def molpay
		# render :text => molpay_params
		transaction = MolpayTransactionHistory.new(molpay_params)
		transaction.save
		@molpay = MolpayTransactionHistory.first
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
		render :text => "this is return url"
		# # nbcb = params[:nbcb]
		# receipt_params = {
		# 					:amount => params[:amount],
		# 					:tran_id => params[:tranID],
		# 					:order_id => params[:orderid],
		# 					:status => params[:status],
		# 					:domain => params[:domain],
		# 					:currency => params[:currency],
		# 					:appcode => params[:appcode],
		# 					:paydate => params[:paydate],
		# 					:channel => params[:channel],
		# 					:error_code => params[:error_code],
		# 					:error_desc => params[:error_desc],
		# 					:skey => params[:skey]
		# 				}

		# # vkey = "09f318dd2c8acd160df1691870ce2abe"

		# # c = [receipt_params[:tran_id], 
		# # 			receipt_params[:order_id], 
		# # 			receipt_params[:status], 
		# # 			receipt_params[:domain], 
		# # 			receipt_params[:amount], 
		# # 			receipt_paramse[:currency]
		# # 		].join
		# # key0 = Digest::MD5.hexdigest(c)
	
		# # z = [receipt_params[:paydate],
		# # 		 receipt_params[:domain], 
		# # 		 key0,
		# # 		 receipt_params[:appcode],
		# # 		 vkey
		# # 		].join
		# # key1 = Digest::MD5.hexdigest(z)
		
		# # if skey != key1
		# 		if params[:status] == "00"
		# 				#sucess
		# 				logger.info {"molpay -- status success "}
		# 				TransactionProcessService.new(receipt_params).process
		# 				# redirect_to molpay_receipt_receipts_path(:order_id => receipt_params[:order_id]), :notice => "Thank Your subscribed"
		# 				redirect_to root_url, notice: "Thank Your Subscribe."
		# 		elsif params[:status] == "22"
		# 			logger.info {"molpay -- Status still pending"}
		# 			redirect_to root_url, :notice => "Molpay payment still pending. Any question contact admin!"
		# 		else
		# 			logger.info {"molpay -- Status failure"}
		# 			redirect_to root_url, :notice => "Molpay payment had failure. Any question contact admin!"
		# 		end
		# # else
		# # 		redirect_to root_url, notice: "skey is equal to key1. Please contact admin!"
		# # end
	end

	private

	def molpay_params
      params.require(:molpay).permit!
  end


end
