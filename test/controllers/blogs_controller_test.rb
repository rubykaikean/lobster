require "test_helper"

describe BlogsController do

  let(:blog) { blogs :one }

  it "gets index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:blogs)
  end

  it "gets new" do
    get :new
    assert_response :success
  end

  it "creates blog" do
    assert_difference('Blog.count') do
      post :create, blog: { description: blog.description, name: blog.name }
    end

    assert_redirected_to blog_path(assigns(:blog))
  end

  it "shows blog" do
    get :show, id: blog
    assert_response :success
  end

  it "gets edit" do
    get :edit, id: blog
    assert_response :success
  end

  it "updates blog" do
    put :update, id: blog, blog: { description: blog.description, name: blog.name }
    assert_redirected_to blog_path(assigns(:blog))
  end

  it "destroys blog" do
    assert_difference('Blog.count', -1) do
      delete :destroy, id: blog
    end

    assert_redirected_to blogs_path
  end

end
