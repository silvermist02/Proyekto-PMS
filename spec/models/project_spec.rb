require 'spec_helper'

describe Project do
	before(:each) do
  	@project = Project.new
  end
  
  it "should not have empty name" do
    @project.name = 'Name'
    @project.should have(0).error_on(:name)
  end
  it "should not have empty description" do
    @project.description = 'Description'
    @project.should have(0).error_on(:description)
  end
  it "should not have empty status" do
    @project.status = 'Active'
    @project.should have(0).error_on(:status)
  end
  it "should not have empty created_at" do
    @project.created_at = '2011-06-03 02:47:33'
    @project.should have(0).error_on(:created_at)
  end
end
