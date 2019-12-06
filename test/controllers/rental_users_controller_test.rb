require 'test_helper'

class RentalUsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @rental_user = rental_users(:one)
  end

  test "should get index" do
    get rental_users_url
    assert_response :success
  end

  test "should get new" do
    get new_rental_user_url
    assert_response :success
  end

  test "should create rental_user" do
    assert_difference('RentalUser.count') do
      post rental_users_url, params: { rental_user: { user_id: @rental_user.user_id } }
    end

    assert_redirected_to rental_user_url(RentalUser.last)
  end

  test "should show rental_user" do
    get rental_user_url(@rental_user)
    assert_response :success
  end

  test "should get edit" do
    get edit_rental_user_url(@rental_user)
    assert_response :success
  end

  test "should update rental_user" do
    patch rental_user_url(@rental_user), params: { rental_user: { user_id: @rental_user.user_id } }
    assert_redirected_to rental_user_url(@rental_user)
  end

  test "should destroy rental_user" do
    assert_difference('RentalUser.count', -1) do
      delete rental_user_url(@rental_user)
    end

    assert_redirected_to rental_users_url
  end
end
