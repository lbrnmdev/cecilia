require 'test_helper'

class DisbursementsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get disbursements_new_url
    assert_response :success
  end

  test "should get show" do
    get disbursements_show_url
    assert_response :success
  end

  test "should get index" do
    get disbursements_index_url
    assert_response :success
  end

  test "should get edit" do
    get disbursements_edit_url
    assert_response :success
  end

end
