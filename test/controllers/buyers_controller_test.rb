require "test_helper"

describe BuyersController do
  # let(:buyer) { buyers :one }

  it "gets index" do
    get :index
    # assert_response :success
    # assert_not_nil assigns(:buyers)
  end

  # it "gets new" do
  #   get :new
  #   assert_response :success
  # end

  # it "creates buyer" do
  #   assert_difference('Buyer.count') do
  #     post :create, buyer: { address: buyer.address, email: buyer.email, full_name: buyer.full_name, home_contact_number: buyer.home_contact_number, ic_number: buyer.ic_number, mobile_contact_number: buyer.mobile_contact_number, office_contact_number: buyer.office_contact_number, status_id: buyer.status_id }
  #   end

  #   assert_redirected_to buyer_path(assigns(:buyer))
  # end

  # it "shows buyer" do
  #   get :show, id: buyer
  #   assert_response :success
  # end

  # it "gets edit" do
  #   get :edit, id: buyer
  #   assert_response :success
  # end

  # it "updates buyer" do
  #   put :update, id: buyer, buyer: { address: buyer.address, email: buyer.email, full_name: buyer.full_name, home_contact_number: buyer.home_contact_number, ic_number: buyer.ic_number, mobile_contact_number: buyer.mobile_contact_number, office_contact_number: buyer.office_contact_number, status_id: buyer.status_id }
  #   assert_redirected_to buyer_path(assigns(:buyer))
  # end

  # it "destroys buyer" do
  #   assert_difference('Buyer.count', -1) do
  #     delete :destroy, id: buyer
  #   end

  #   assert_redirected_to buyers_path
  # end

end
