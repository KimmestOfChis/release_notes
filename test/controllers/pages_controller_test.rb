require 'test_helper'

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get pages_home_url
    assert_response :success
  end

  test "should get issues" do
    get pages_issues_url
    assert_response :success
  end

  test "should get my_profile" do
    get pages_my_profile_url
    assert_response :success
  end

end
