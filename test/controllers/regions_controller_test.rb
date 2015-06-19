require "test_helper"

describe RegionsController do

  let(:region) { regions :one }

  it "gets index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:regions)
  end

  it "gets new" do
    get :new
    assert_response :success
  end

  it "creates region" do
    assert_difference('Region.count') do
      post :create, region: { name: region.name }
    end

    assert_redirected_to region_path(assigns(:region))
  end

  it "shows region" do
    get :show, id: region
    assert_response :success
  end

  it "gets edit" do
    get :edit, id: region
    assert_response :success
  end

  it "updates region" do
    put :update, id: region, region: { name: region.name }
    assert_redirected_to region_path(assigns(:region))
  end

  it "destroys region" do
    assert_difference('Region.count', -1) do
      delete :destroy, id: region
    end

    assert_redirected_to regions_path
  end

end
