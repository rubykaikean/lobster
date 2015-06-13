require "test_helper"

describe CompanySettingsController do

  let(:company_setting) { company_settings :one }

  it "gets index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:company_settings)
  end

  it "gets new" do
    get :new
    assert_response :success
  end

  it "creates company_setting" do
    assert_difference('CompanySetting.count') do
      post :create, company_setting: { allow_multple_booking: company_setting.allow_multple_booking, company_id: company_setting.company_id }
    end

    assert_redirected_to company_setting_path(assigns(:company_setting))
  end

  it "shows company_setting" do
    get :show, id: company_setting
    assert_response :success
  end

  it "gets edit" do
    get :edit, id: company_setting
    assert_response :success
  end

  it "updates company_setting" do
    put :update, id: company_setting, company_setting: { allow_multple_booking: company_setting.allow_multple_booking, company_id: company_setting.company_id }
    assert_redirected_to company_setting_path(assigns(:company_setting))
  end

  it "destroys company_setting" do
    assert_difference('CompanySetting.count', -1) do
      delete :destroy, id: company_setting
    end

    assert_redirected_to company_settings_path
  end

end
