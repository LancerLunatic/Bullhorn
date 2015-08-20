require 'test_helper'

class MoosControllerTest < ActionController::TestCase
  setup do
    @moo = moos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:moos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create moo" do
    assert_difference('Moo.count') do
      post :create, moo: { content: @moo.content }
    end

    assert_redirected_to moo_path(assigns(:moo))
  end

  test "should show moo" do
    get :show, id: @moo
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @moo
    assert_response :success
  end

  test "should update moo" do
    patch :update, id: @moo, moo: { content: @moo.content }
    assert_redirected_to moo_path(assigns(:moo))
  end

  test "should destroy moo" do
    assert_difference('Moo.count', -1) do
      delete :destroy, id: @moo
    end

    assert_redirected_to moos_path
  end
end
