require "application_system_test_case"

class ModifiedDocumentsTest < ApplicationSystemTestCase
  setup do
    @modified_document = modified_documents(:one)
  end

  test "visiting the index" do
    visit modified_documents_url
    assert_selector "h1", text: "Modified Documents"
  end

  test "creating a Modified document" do
    visit modified_documents_url
    click_on "New Modified Document"

    fill_in "Lat destination", with: @modified_document.lat_destination
    fill_in "Long destination", with: @modified_document.long_destination
    fill_in "Price", with: @modified_document.price
    click_on "Create Modified document"

    assert_text "Modified document was successfully created"
    click_on "Back"
  end

  test "updating a Modified document" do
    visit modified_documents_url
    click_on "Edit", match: :first

    fill_in "Lat destination", with: @modified_document.lat_destination
    fill_in "Long destination", with: @modified_document.long_destination
    fill_in "Price", with: @modified_document.price
    click_on "Update Modified document"

    assert_text "Modified document was successfully updated"
    click_on "Back"
  end

  test "destroying a Modified document" do
    visit modified_documents_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Modified document was successfully destroyed"
  end
end
