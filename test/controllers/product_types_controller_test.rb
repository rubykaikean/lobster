require "test_helper"

describe ProductTypesController do

  let(:product_type) { product_types :one }

  it "gets index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:product_types)
  end

  it "gets new" do
    get :new
    assert_response :success
  end

  it "creates product_type" do
    assert_difference('ProductType.count') do
      post :create, product_type: { description: product_type.description, name: product_type.name, product_id: product_type.product_id }
    end

    assert_redirected_to product_type_path(assigns(:product_type))
  end

  it "shows product_type" do
    get :show, id: product_type
    assert_response :success
  end

  it "gets edit" do
    get :edit, id: product_type
    assert_response :success
  end

  it "updates product_type" do
    put :update, id: product_type, product_type: { description: product_type.description, name: product_type.name, product_id: product_type.product_id }
    assert_redirected_to product_type_path(assigns(:product_type))
  end

  it "destroys product_type" do
    assert_difference('ProductType.count', -1) do
      delete :destroy, id: product_type
    end

    assert_redirected_to product_types_path
  end

end
