require 'test_helper'

class YearbooksControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get yearbooks_index_url
    assert_response :success
  end

  test "should get new" do
    get yearbooks_new_url
    assert_response :success
  end

  test "should get show" do
    get yearbooks_show_url
    assert_response :success
  end

end
