require 'test_helper'

class UserlistsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:userlists)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create userlist" do
    assert_difference('Userlist.count') do
      post :create, :userlist => { }
    end

    assert_redirected_to userlist_path(assigns(:userlist))
  end

  test "should show userlist" do
    get :show, :id => userlists(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => userlists(:one).to_param
    assert_response :success
  end

  test "should update userlist" do
    put :update, :id => userlists(:one).to_param, :userlist => { }
    assert_redirected_to userlist_path(assigns(:userlist))
  end

  test "should destroy userlist" do
    assert_difference('Userlist.count', -1) do
      delete :destroy, :id => userlists(:one).to_param
    end

    assert_redirected_to userlists_path
  end
end
