require "test_helper"

describe SalesController do

  let(:sale) { sales :one }

  it "gets index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sales)
  end

  it "gets new" do
    get :new
    assert_response :success
  end

  it "creates sale" do
    assert_difference('Sale.count') do
      post :create, sale: { lot_unit_id: sale.lot_unit_id, phase_id: sale.phase_id, product_id: sale.product_id, project_id: sale.project_id, status_id: sale.status_id, user_id: sale.user_id }
    end

    assert_redirected_to sale_path(assigns(:sale))
  end

  it "shows sale" do
    get :show, id: sale
    assert_response :success
  end

  it "gets edit" do
    get :edit, id: sale
    assert_response :success
  end

  it "updates sale" do
    put :update, id: sale, sale: { lot_unit_id: sale.lot_unit_id, phase_id: sale.phase_id, product_id: sale.product_id, project_id: sale.project_id, status_id: sale.status_id, user_id: sale.user_id }
    assert_redirected_to sale_path(assigns(:sale))
  end

  it "destroys sale" do
    assert_difference('Sale.count', -1) do
      delete :destroy, id: sale
    end

    assert_redirected_to sales_path
  end

end
