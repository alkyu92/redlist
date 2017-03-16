require 'test_helper'

class ResearchesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get researches_new_url
    assert_response :success
  end

  test "should get edit" do
    get researches_edit_url
    assert_response :success
  end

end
