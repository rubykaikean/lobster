require "test_helper"

describe ProductsController do

  let(:product) { products :one }

  it "gets index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:products)
  end

  it "gets new" do
    get :new
    assert_response :success
  end

  it "creates product" do
    assert_difference('Product.count') do
      post :create, product: { description: product.description, name: product.name, phase_id: product.phase_id, status_id: product.status_id, type_id: product.type_id }
    end

    assert_redirected_to product_path(assigns(:product))
  end

  it "shows product" do
    get :show, id: product
    assert_response :success
  end

  it "gets edit" do
    get :edit, id: product
    assert_response :success
  end

  it "updates product" do
    put :update, id: product, product: { description: product.description, name: product.name, phase_id: product.phase_id, status_id: product.status_id, type_id: product.type_id }
    assert_redirected_to product_path(assigns(:product))
  end

  it "destroys product" do
    assert_difference('Product.count', -1) do
      delete :destroy, id: product
    end

    assert_redirected_to products_path
  end

end
