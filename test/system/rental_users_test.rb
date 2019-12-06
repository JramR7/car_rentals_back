require "application_system_test_case"

class RentalUsersTest < ApplicationSystemTestCase
  setup do
    @rental_user = rental_users(:one)
  end

  test "visiting the index" do
    visit rental_users_url
    assert_selector "h1", text: "Rental Users"
  end

  test "creating a Rental user" do
    visit rental_users_url
    click_on "New Rental User"

    fill_in "User", with: @rental_user.user_id
    click_on "Create Rental user"

    assert_text "Rental user was successfully created"
    click_on "Back"
  end

  test "updating a Rental user" do
    visit rental_users_url
    click_on "Edit", match: :first

    fill_in "User", with: @rental_user.user_id
    click_on "Update Rental user"

    assert_text "Rental user was successfully updated"
    click_on "Back"
  end

  test "destroying a Rental user" do
    visit rental_users_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Rental user was successfully destroyed"
  end
end
