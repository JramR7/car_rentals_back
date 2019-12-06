require 'test_helper'

class ModifiedDocumentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @modified_document = modified_documents(:one)
  end

  test "should get index" do
    get modified_documents_url
    assert_response :success
  end

  test "should get new" do
    get new_modified_document_url
    assert_response :success
  end

  test "should create modified_document" do
    assert_difference('ModifiedDocument.count') do
      post modified_documents_url, params: { modified_document: { lat_destination: @modified_document.lat_destination, long_destination: @modified_document.long_destination, price: @modified_document.price } }
    end

    assert_redirected_to modified_document_url(ModifiedDocument.last)
  end

  test "should show modified_document" do
    get modified_document_url(@modified_document)
    assert_response :success
  end

  test "should get edit" do
    get edit_modified_document_url(@modified_document)
    assert_response :success
  end

  test "should update modified_document" do
    patch modified_document_url(@modified_document), params: { modified_document: { lat_destination: @modified_document.lat_destination, long_destination: @modified_document.long_destination, price: @modified_document.price } }
    assert_redirected_to modified_document_url(@modified_document)
  end

  test "should destroy modified_document" do
    assert_difference('ModifiedDocument.count', -1) do
      delete modified_document_url(@modified_document)
    end

    assert_redirected_to modified_documents_url
  end
end
