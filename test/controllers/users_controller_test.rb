require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    sign_in_as @user
  end

  test "should get new" do
    get register_path
    assert_response :success
  end

  test "should create user" do
    assert_difference('User.count') do
      post register_path, params: { user: { email: 'newuser@example.com', password: 'password', password_confirmation: 'password', role: 'buyer' } }
    end

    assert_redirected_to root_path
  end

  test "should get edit" do
    get profile_path
    assert_response :success
  end

  test "should update user" do
    patch profile_path, params: { user: { email: 'updated@example.com', password: 'password', password_confirmation: 'password', role: 'buyer' } }
    assert_redirected_to profile_path
  end

  test "should not update user with invalid email" do
    patch profile_path, params: { user: { email: '' } }
    assert_response :unprocessable_entity
  end
end
