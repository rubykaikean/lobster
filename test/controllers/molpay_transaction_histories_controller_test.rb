require "test_helper"

describe MolpayTransactionHistoriesController do

  let(:molpay_transaction_history) { molpay_transaction_histories :one }

  it "gets index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:molpay_transaction_histories)
  end

  it "gets new" do
    get :new
    assert_response :success
  end

  it "creates molpay_transaction_history" do
    assert_difference('MolpayTransactionHistory.count') do
      post :create, molpay_transaction_history: { amount: molpay_transaction_history.amount, appcode: molpay_transaction_history.appcode, bill_desc: molpay_transaction_history.bill_desc, bill_email: molpay_transaction_history.bill_email, bill_mobile: molpay_transaction_history.bill_mobile, bill_name: molpay_transaction_history.bill_name, channel: molpay_transaction_history.channel, currency: molpay_transaction_history.currency, domain: molpay_transaction_history.domain, error_code: molpay_transaction_history.error_code, error_desc: molpay_transaction_history.error_desc, is_paid: molpay_transaction_history.is_paid, order_id: molpay_transaction_history.order_id, paydate: molpay_transaction_history.paydate, sale_id: molpay_transaction_history.sale_id, status: molpay_transaction_history.status, tran_id: molpay_transaction_history.tran_id }
    end

    assert_redirected_to molpay_transaction_history_path(assigns(:molpay_transaction_history))
  end

  it "shows molpay_transaction_history" do
    get :show, id: molpay_transaction_history
    assert_response :success
  end

  it "gets edit" do
    get :edit, id: molpay_transaction_history
    assert_response :success
  end

  it "updates molpay_transaction_history" do
    put :update, id: molpay_transaction_history, molpay_transaction_history: { amount: molpay_transaction_history.amount, appcode: molpay_transaction_history.appcode, bill_desc: molpay_transaction_history.bill_desc, bill_email: molpay_transaction_history.bill_email, bill_mobile: molpay_transaction_history.bill_mobile, bill_name: molpay_transaction_history.bill_name, channel: molpay_transaction_history.channel, currency: molpay_transaction_history.currency, domain: molpay_transaction_history.domain, error_code: molpay_transaction_history.error_code, error_desc: molpay_transaction_history.error_desc, is_paid: molpay_transaction_history.is_paid, order_id: molpay_transaction_history.order_id, paydate: molpay_transaction_history.paydate, sale_id: molpay_transaction_history.sale_id, status: molpay_transaction_history.status, tran_id: molpay_transaction_history.tran_id }
    assert_redirected_to molpay_transaction_history_path(assigns(:molpay_transaction_history))
  end

  it "destroys molpay_transaction_history" do
    assert_difference('MolpayTransactionHistory.count', -1) do
      delete :destroy, id: molpay_transaction_history
    end

    assert_redirected_to molpay_transaction_histories_path
  end

end
