require "test_helper"

describe FloorPlansController do

  let(:floor_plan) { floor_plans :one }

  it "gets index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:floor_plans)
  end

  it "gets new" do
    get :new
    assert_response :success
  end

  it "creates floor_plan" do
    assert_difference('FloorPlan.count') do
      post :create, floor_plan: { project_id: floor_plan.project_id }
    end

    assert_redirected_to floor_plan_path(assigns(:floor_plan))
  end

  it "shows floor_plan" do
    get :show, id: floor_plan
    assert_response :success
  end

  it "gets edit" do
    get :edit, id: floor_plan
    assert_response :success
  end

  it "updates floor_plan" do
    put :update, id: floor_plan, floor_plan: { project_id: floor_plan.project_id }
    assert_redirected_to floor_plan_path(assigns(:floor_plan))
  end

  it "destroys floor_plan" do
    assert_difference('FloorPlan.count', -1) do
      delete :destroy, id: floor_plan
    end

    assert_redirected_to floor_plans_path
  end

end
