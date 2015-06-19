require "test_helper"

describe SitePlansController do

  let(:site_plan) { site_plans :one }

  it "gets index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:site_plans)
  end

  it "gets new" do
    get :new
    assert_response :success
  end

  it "creates site_plan" do
    assert_difference('SitePlan.count') do
      post :create, site_plan: { project_id: site_plan.project_id }
    end

    assert_redirected_to site_plan_path(assigns(:site_plan))
  end

  it "shows site_plan" do
    get :show, id: site_plan
    assert_response :success
  end

  it "gets edit" do
    get :edit, id: site_plan
    assert_response :success
  end

  it "updates site_plan" do
    put :update, id: site_plan, site_plan: { project_id: site_plan.project_id }
    assert_redirected_to site_plan_path(assigns(:site_plan))
  end

  it "destroys site_plan" do
    assert_difference('SitePlan.count', -1) do
      delete :destroy, id: site_plan
    end

    assert_redirected_to site_plans_path
  end

end
