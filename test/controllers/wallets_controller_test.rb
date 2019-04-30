require 'test_helper'

class WalletsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get wallets_new_url
    assert_response :success
  end

  test "should get show" do
    get wallets_show_url
    assert_response :success
  end

  test "should get index" do
    get wallets_index_url
    assert_response :success
  end

  test "should get edit" do
    get wallets_edit_url
    assert_response :success
  end

end
