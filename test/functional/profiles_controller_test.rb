require 'test_helper'

class ProfilesControllerTest < ActionController::TestCase
  test "should get show" do
    get :show, id: users(:tuan).profile_name
    assert_response :success
    assert_template 'profiles/show'
  end

  test "should render a 404 on profile not found" do
  	get :show, id: "doesn't exist"
  	assert_response :not_found
  end

  test "that variables are assigned successful in profile view" do
  	 get :show, id: users(:tuan).profile_name
  	 assert assigns(:user)
  	 assert_not_empty  assigns(:statuses)
  end

  test "should user have a correct status" do
  	get :show, id: users(:tuan).profile_name
  	assigns(:statuses).each do |status|
  	 assert_equal users(:tuan), status.user
  	end
  end

end
