require "test_helper"

describe EmailSettingsController do

  let(:email_setting) { email_settings :one }

  it "gets index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:email_settings)
  end

  it "gets new" do
    get :new
    assert_response :success
  end

  it "creates email_setting" do
    assert_difference('EmailSetting.count') do
      post :create, email_setting: { body: email_setting.body, from: email_setting.from, product_id: email_setting.product_id, subject: email_setting.subject }
    end

    assert_redirected_to email_setting_path(assigns(:email_setting))
  end

  it "shows email_setting" do
    get :show, id: email_setting
    assert_response :success
  end

  it "gets edit" do
    get :edit, id: email_setting
    assert_response :success
  end

  it "updates email_setting" do
    put :update, id: email_setting, email_setting: { body: email_setting.body, from: email_setting.from, product_id: email_setting.product_id, subject: email_setting.subject }
    assert_redirected_to email_setting_path(assigns(:email_setting))
  end

  it "destroys email_setting" do
    assert_difference('EmailSetting.count', -1) do
      delete :destroy, id: email_setting
    end

    assert_redirected_to email_settings_path
  end

end
