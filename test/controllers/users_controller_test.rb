require "test_helper"

describe UsersController do

  let(:user) { users :one }

  it "gets index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:users)
  end

  it "gets new" do
    get :new
    assert_response :success
  end

  it "creates user" do
    assert_difference('User.count') do
      post :create, user: { company_id: user.company_id, display_name: user.display_name, type_id: user.type_id }
    end

    assert_redirected_to user_path(assigns(:user))
  end

  it "shows user" do
    get :show, id: user
    assert_response :success
  end

  it "gets edit" do
    get :edit, id: user
    assert_response :success
  end

  it "updates user" do
    put :update, id: user, user: { company_id: user.company_id, display_name: user.display_name, type_id: user.type_id }
    assert_redirected_to user_path(assigns(:user))
  end

  it "destroys user" do
    assert_difference('User.count', -1) do
      delete :destroy, id: user
    end

    assert_redirected_to users_path
  end

end
