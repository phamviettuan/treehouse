require 'test_helper'

class CustomRoutesTest < ActionDispatch::IntegrationTest
   test "that /sign_in route opens the login page" do
   	 get '/sign_in'
     assert_response :success
    end

    test "that /log_out route opens the log_out page" do
    	get '/log_out'
    	assert_response :redirect
    	assert_redirected_to '/'
    end

    test "that /register route opens the register page" do
    	get '/register'
    	assert_response :success
    end

end
