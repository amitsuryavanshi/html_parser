require 'test_helper'

class DocumentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @document = documents(:one)
  end

  test "should get index" do
    get documents_url, as: :json
    assert_response :success
  end

  test "should create document" do
    assert_difference('Document.count') do
      post documents_url, params: { document: { h1_tags: @document.h1_tags, h2_tags: @document.h2_tags, h3_tags: @document.h3_tags, links: @document.links, url: @document.url } }, as: :json
    end

    assert_response 201
  end

  test "should show document" do
    get document_url(@document), as: :json
    assert_response :success
  end

  test "should update document" do
    patch document_url(@document), params: { document: { h1_tags: @document.h1_tags, h2_tags: @document.h2_tags, h3_tags: @document.h3_tags, links: @document.links, url: @document.url } }, as: :json
    assert_response 200
  end

  test "should destroy document" do
    assert_difference('Document.count', -1) do
      delete document_url(@document), as: :json
    end

    assert_response 204
  end
end
