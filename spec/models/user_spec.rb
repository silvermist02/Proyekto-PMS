require 'spec_helper'

describe User do
	before(:each) do
  	@user = User.new
  end
  
  it "should not have empty user_name" do
    @user.user_name = 'User Name'
    @user.should have(0).error_on(:user_name)
  end
  it "should not have empty first_name" do
    @user.first_name = 'First Name'
    @user.should have(0).error_on(:first_name)
  end
  it "should not have empty middle_name" do
    @user.middle_name = 'Middle Name'
    @user.should have(0).error_on(:middle_name)
  end
  it "should not have empty last_name" do
    @user.last_name = 'Last Name'
    @user.should have(0).error_on(:last_name)
  end
  it "should not have empty email" do
    @user.email = 'e@mail.com'
    @user.should have(0).error_on(:email)
  end 
  it "should not have empty status" do
    @user.status = 'Active'
    @user.should have(0).error_on(:status)
  end
  it "should not have empty created_at" do
    @user.created_at = '2011-06-03 02:47:33'
    @user.should have(0).error_on(:created_at)
  end
end
