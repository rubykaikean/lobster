require "test_helper"

describe EnquiriesController do

  let(:enquiry) { enquiries :one }

  it "gets index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:enquiries)
  end

  it "gets new" do
    get :new
    assert_response :success
  end

  it "creates enquiry" do
    assert_difference('Enquiry.count') do
      post :create, enquiry: { product_id: enquiry.product_id }
    end

    assert_redirected_to enquiry_path(assigns(:enquiry))
  end

  it "shows enquiry" do
    get :show, id: enquiry
    assert_response :success
  end

  it "gets edit" do
    get :edit, id: enquiry
    assert_response :success
  end

  it "updates enquiry" do
    put :update, id: enquiry, enquiry: { product_id: enquiry.product_id }
    assert_redirected_to enquiry_path(assigns(:enquiry))
  end

  it "destroys enquiry" do
    assert_difference('Enquiry.count', -1) do
      delete :destroy, id: enquiry
    end

    assert_redirected_to enquiries_path
  end

end
