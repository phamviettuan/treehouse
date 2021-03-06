require 'test_helper'

class UserTest < ActiveSupport::TestCase
 test "user should enter the first name" do
 	user = User.new
 	assert !user.save
 	assert !user.errors[:first_name].empty?
 end

 test "user should enter the last name" do
 	user = User.new
 	assert !user.save
 	assert !user.errors[:last_name].empty?
 end

 test "user should enter the profile name" do
 	user = User.new
 	assert !user.save
 	assert !user.errors[:profile_name].empty?
 end

 test "user should have a unique profile name" do
 	user = User.new
 	user.profile_name = users(:tuan).profile_name
 	assert !user.save
 	assert !user.errors[:profile_name].empty?
 end

 test "user should have a profile name without spaces" do
 	user = User.new
 	user.profile_name = "My profile with spaces"
 	assert !user.save
 	assert !user.errors[:profile_name].empty?
 	assert  user.errors[:profile_name].include?("Must be formatted correctly!")
 end

 test "a user can have a correctly formatted profile name" do
 	user = User.new(first_name: "Tuan", last_name: "Pham", email: "tuanp1711@gmail.com")
 	user.password = user.password_confirmation = "abcde"

 	user.profile_name = "tuanpham"
 	assert user.valid?
 end
end

