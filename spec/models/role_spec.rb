require 'spec_helper'

describe Role do
	before(:each) do
  	@role = Role.new
  end
  
  it "should not have empty name" do
    @role.name = 'Name'
    @role.should have(0).error_on(:name)
  end
end
