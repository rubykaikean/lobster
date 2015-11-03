require "test_helper"

describe ReceiptsController do

  let(:receipt) { receipts :one }

  it "gets index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:receipts)
  end

  it "gets new" do
    get :new
    assert_response :success
  end

  it "creates receipt" do
    assert_difference('Receipt.count') do
      post :create, receipt: { appcode: receipt.appcode, channel: receipt.channel, currency: receipt.currency, domain: receipt.domain, error_code: receipt.error_code, error_desc: receipt.error_desc, orderid: receipt.orderid, paydate: receipt.paydate, skey: receipt.skey, tran_id: receipt.tran_id, user_id: receipt.user_id }
    end

    assert_redirected_to receipt_path(assigns(:receipt))
  end

  it "shows receipt" do
    get :show, id: receipt
    assert_response :success
  end

  it "gets edit" do
    get :edit, id: receipt
    assert_response :success
  end

  it "updates receipt" do
    put :update, id: receipt, receipt: { appcode: receipt.appcode, channel: receipt.channel, currency: receipt.currency, domain: receipt.domain, error_code: receipt.error_code, error_desc: receipt.error_desc, orderid: receipt.orderid, paydate: receipt.paydate, skey: receipt.skey, tran_id: receipt.tran_id, user_id: receipt.user_id }
    assert_redirected_to receipt_path(assigns(:receipt))
  end

  it "destroys receipt" do
    assert_difference('Receipt.count', -1) do
      delete :destroy, id: receipt
    end

    assert_redirected_to receipts_path
  end

end
