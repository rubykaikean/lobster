require "test_helper"

describe LotsController do

  let(:lot) { lots :one }

  it "gets index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:lots)
  end

  it "gets new" do
    get :new
    assert_response :success
  end

  it "creates lot" do
    assert_difference('Lot.count') do
      post :create, lot: { description: lot.description, name: lot.name, product_id: lot.product_id }
    end

    assert_redirected_to lot_path(assigns(:lot))
  end

  it "shows lot" do
    get :show, id: lot
    assert_response :success
  end

  it "gets edit" do
    get :edit, id: lot
    assert_response :success
  end

  it "updates lot" do
    put :update, id: lot, lot: { description: lot.description, name: lot.name, product_id: lot.product_id }
    assert_redirected_to lot_path(assigns(:lot))
  end

  it "destroys lot" do
    assert_difference('Lot.count', -1) do
      delete :destroy, id: lot
    end

    assert_redirected_to lots_path
  end

end
