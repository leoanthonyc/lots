require "test_helper"

class ItemsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get items_url
    assert_response :success
  end

  test "should get new" do
    get new_item_url
    assert_response :success
  end

  test "should get create" do
    post items_url, params: { item: { name: 'Farm A' } }
    assert_response :redirect
  end

  test "should get show" do
    item = items(:lot_a)
    get item_url(item)
    assert_response :success
  end

  test "should get edit" do
    item = items(:lot_a)
    get edit_item_url(item)
    assert_response :success
  end

  test "should get update" do
    item = items(:lot_a)
    put item_url(item), params: { item: { name: 'Residential A' } }
    assert_response :redirect
  end
end
