require "test_helper"

describe AdminsController do

  let(:admin) { admins :one }

  it "gets index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admins)
  end

  it "gets new" do
    get :new
    assert_response :success
  end

  it "creates admin" do
    assert_difference('Admin.count') do
      post :create, admin: { name: admin.name }
    end

    assert_redirected_to admin_path(assigns(:admin))
  end

  it "shows admin" do
    get :show, id: admin
    assert_response :success
  end

  it "gets edit" do
    get :edit, id: admin
    assert_response :success
  end

  it "updates admin" do
    put :update, id: admin, admin: { name: admin.name }
    assert_redirected_to admin_path(assigns(:admin))
  end

  it "destroys admin" do
    assert_difference('Admin.count', -1) do
      delete :destroy, id: admin
    end

    assert_redirected_to admins_path
  end

end
