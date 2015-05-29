require "test_helper"

describe CompaniesController do

  let(:company) { companies :one }

  it "gets index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:companies)
  end

  it "gets new" do
    get :new
    assert_response :success
  end

  it "creates company" do
    assert_difference('Company.count') do
      post :create, company: { address: company.address, fax_number: company.fax_number, name: company.name, phone_number: company.phone_number, registration_number: company.registration_number }
    end

    assert_redirected_to company_path(assigns(:company))
  end

  it "shows company" do
    get :show, id: company
    assert_response :success
  end

  it "gets edit" do
    get :edit, id: company
    assert_response :success
  end

  it "updates company" do
    put :update, id: company, company: { address: company.address, fax_number: company.fax_number, name: company.name, phone_number: company.phone_number, registration_number: company.registration_number }
    assert_redirected_to company_path(assigns(:company))
  end

  it "destroys company" do
    assert_difference('Company.count', -1) do
      delete :destroy, id: company.id
    end

    assert_redirected_to companies_path
  end

end
