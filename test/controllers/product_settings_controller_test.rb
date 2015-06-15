require "test_helper"

describe ProductSettingsController do

  let(:product_setting) { product_settings :one }

  it "gets index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:product_settings)
  end

  it "gets new" do
    get :new
    assert_response :success
  end

  it "creates product_setting" do
    assert_difference('ProductSetting.count') do
      post :create, product_setting: { allow_multiple_booking: product_setting.allow_multiple_booking }
    end

    assert_redirected_to product_setting_path(assigns(:product_setting))
  end

  it "shows product_setting" do
    get :show, id: product_setting
    assert_response :success
  end

  it "gets edit" do
    get :edit, id: product_setting
    assert_response :success
  end

  it "updates product_setting" do
    put :update, id: product_setting, product_setting: { allow_multiple_booking: product_setting.allow_multiple_booking }
    assert_redirected_to product_setting_path(assigns(:product_setting))
  end

  it "destroys product_setting" do
    assert_difference('ProductSetting.count', -1) do
      delete :destroy, id: product_setting
    end

    assert_redirected_to product_settings_path
  end

end
