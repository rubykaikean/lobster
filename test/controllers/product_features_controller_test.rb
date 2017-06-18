require "test_helper"

describe ProductFeaturesController do

  let(:product_feature) { product_features :one }

  it "gets index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:product_features)
  end

  it "gets new" do
    get :new
    assert_response :success
  end

  it "creates product_feature" do
    assert_difference('ProductFeature.count') do
      post :create, product_feature: { name: product_feature.name, product_id: product_feature.product_id }
    end

    assert_redirected_to product_feature_path(assigns(:product_feature))
  end

  it "shows product_feature" do
    get :show, id: product_feature
    assert_response :success
  end

  it "gets edit" do
    get :edit, id: product_feature
    assert_response :success
  end

  it "updates product_feature" do
    put :update, id: product_feature, product_feature: { name: product_feature.name, product_id: product_feature.product_id }
    assert_redirected_to product_feature_path(assigns(:product_feature))
  end

  it "destroys product_feature" do
    assert_difference('ProductFeature.count', -1) do
      delete :destroy, id: product_feature
    end

    assert_redirected_to product_features_path
  end

end
